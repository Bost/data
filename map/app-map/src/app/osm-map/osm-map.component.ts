import {ChangeDetectorRef, Component, ElementRef, OnDestroy, OnInit, Renderer2, ViewChild} from '@angular/core';
import {SocialMediaPlatform, Association, Link, SocialMediaLink, Image, Contact} from '../model/association';
import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile';
import {fromLonLat} from 'ol/proj';
import OSM from 'ol/source/OSM';
import {Overlay} from 'ol';
import OverlayPositioning from 'ol/OverlayPositioning';
import {Coordinate} from 'ol/coordinate';
import {ResizeObserver} from 'resize-observer';
import {Size} from 'ol/size';
import {DropdownOption, getSubOptions} from '../model/dropdown-option';
import {AutoComplete} from 'primeng/autocomplete';
import {MysqlQueryService} from '../services/mysql-query.service';
import {MyHttpResponse} from '../model/http-response';
import {MessageService} from 'primeng/api';
import VectorSource from 'ol/source/Vector';
import Cluster from 'ol/source/Cluster';
import Feature from 'ol/Feature';
import CircleStyle from 'ol/style/Circle';
import VectorLayer from 'ol/layer/Vector';
import Style from 'ol/style/Style';
import Stroke from 'ol/style/Stroke';
import Fill from 'ol/style/Fill';
import Text from 'ol/style/Text';
import Point from 'ol/geom/Point';
import RenderFeature from 'ol/render/Feature';
import Geometry from 'ol/geom/Geometry';
import Icon from 'ol/style/Icon';
import {createEmpty, extend, Extent} from 'ol/extent';
import hexToRgba from 'hex-to-rgba';
// @ts-ignore
import AnimatedCluster from 'ol-ext/layer/AnimatedCluster';
import {
  getFeatureCoordinate,
  getFirstOriginalFeatureId,
  getOriginalFeatures,
  getOriginalFeaturesIds,
  isClusteredFeature
} from './map.utils';

@Component({
  selector: 'app-osm-map',
  templateUrl: './osm-map.component.html',
  styleUrls: ['./osm-map.component.scss'],
  providers: [
    MessageService
  ]
})
export class OsmMapComponent implements OnInit, OnDestroy {
  sidebarExpanded = true;
  SIDEBAR_ANIMATION_DURATION = 300;

  blocked = true;
  loadingText = 'Vereine abrufen...';

  advancedSearchVisible = false;
  districtOptions: DropdownOption[] = [];
  activitiesOptions: DropdownOption[] = [];
  selectedDistricts: any[] = [];
  selectedActivities: any[] = [];

  map?: Map;
  clusterSource?: VectorSource;
  cluster?: Cluster;
  clusterFeatures: Feature[] = [];
  clusterLayer?: VectorLayer;

  markers: Overlay[] = [];
  popup?: Overlay;

  popupVisible = false;
  popupContentAssociationId?: string;

  // @ts-ignore
  associations: Association[] = [];
  filteredAssociations: Association[] = [];

  @ViewChild('osmContainer', {static: true}) osmContainer!: ElementRef<HTMLDivElement>;
  @ViewChild('autoComplete', {static: true}) autoComplete?: AutoComplete;
  resizeObserver?: ResizeObserver;

  constructor(private renderer2: Renderer2,
              private mySqlQueryService: MysqlQueryService,
              private messageService: MessageService,
              private changeDetectorRef: ChangeDetectorRef) {
  }

  /**
   * queries the association data from the database and initializes map and sidebar
   */
  async ngOnInit(): Promise<void> {
    this.blocked = true;
    this.loadingText = 'Vereine abrufen...';

    const httpResponse: MyHttpResponse<Association[]> = (await this.mySqlQueryService.getAssociations());
    this.associations = httpResponse?.data ? httpResponse.data.sort(
      (a: Association, b: Association) => {
        const name1 = a.shortName || a.name;
        const name2 = b.shortName || b.name;
        return name1.toLowerCase() > name2.toLowerCase() ? 1 : (name1.toLowerCase() < name2.toLowerCase() ? -1 : 0);
      }
    ) : [];

    this.districtOptions = (await this.mySqlQueryService.getDistrictOptions())?.data || [];
    this.activitiesOptions = (await this.mySqlQueryService.getActivitiesOptions())?.data || [];

    if (!this.associations?.length) {
      this.messageService.add({
        severity: 'error',
        summary: 'Fehler beim Abrufen der Vereine',
        detail: httpResponse?.errorMessage || '',
        key: 'mapToast'
      });
    }

    this.filteredAssociations = this.associations;

    if (this.osmContainer?.nativeElement?.clientWidth < 360 && this.sidebarExpanded) {
      this.sidebarExpanded = false;
    }

    this.initMap();

    // detects browser resize events
    this.resizeObserver = new ResizeObserver(() => {
      this.resizeMapContainer();
    });
    this.resizeObserver.observe(this.osmContainer.nativeElement);

    this.blocked = false;
  }

  /**
   * toggles visibility of the sidebar
   */
  toggleSidebar(): void {
    this.sidebarExpanded = !this.sidebarExpanded;
  }

  /**
   * (re-)initializes the map and the map markers
   */
  initMap(): void {
    if (this.map) {
      this.map.setTarget(undefined);
      this.map = undefined;
    }

    this.changeDetectorRef.detectChanges();

    const rasterLayer = new TileLayer({
      source: new OSM()
    });

    this.clusterLayer = this.initCluster();

    this.map = new Map({
      target: document.getElementById('osm-map') ?? undefined,
      layers: [rasterLayer, this.clusterLayer],
      view: new View({
        center: fromLonLat([9.179747886339912, 48.77860400126555]),
        zoom: 14
      })
    });

    this.map.on('click', this.mapClickHandler);
    this.map.on('pointermove', this.mapPointerMoveHandler);

    this.associations.map((s: Association) => {
      this.addMarker(s.lat, s.lng, s.id);
    });

    this.changeDetectorRef.detectChanges();
    this.map.redrawText();
  }

  /**
   * initializes the cluster layer with the map marker features
   */
  initCluster(): VectorLayer {
    this.clusterSource = new VectorSource({
      features: this.clusterFeatures
    });

    this.cluster = new Cluster({
      distance: 50,
      source: this.clusterSource
    });

    const clusterLayer = new AnimatedCluster({
      source: this.cluster,
      style: this.getAnimatedClusterStyle,
      animationDuration: this.SIDEBAR_ANIMATION_DURATION
    });
    return clusterLayer;
  }

  /**
   * style function that returns the style for marker cluster features
   * @param feature map feature
   */
  getAnimatedClusterStyle = (feature: Feature<Geometry> | RenderFeature) => {
    const originalFeatures = getOriginalFeatures(feature);
    const featureIds: string[] = getOriginalFeaturesIds(feature);
    const filteredIds: string[] = this.filteredAssociations.map((a: Association) => a.id);
    const allIncluded: boolean = featureIds.every((id: string) => filteredIds.includes(id));
    const isFiltered: boolean = featureIds.some((id: string) => filteredIds.includes(id));
    const size = originalFeatures?.length;
    let style;
    const baseColor = '#d13858' // '#ed2227'
    if (!style) {
      if (size && size > 1) {
        style = new Style({
          image: new CircleStyle({
            radius: 15,
            stroke: new Stroke({
              color: '#231f20',
            }),
            fill: new Fill({
              color: allIncluded ? baseColor : isFiltered ? '#B47172' : '#989898',
            }),
          }),
          text: new Text({
            text: size.toString(),
            font: '16px Alegreya',
            fill: new Fill({
              color: '#fff',
            }),
          }),
        });
      } else {
        const noPubAddr = false
        const noPubAddrColor = '#00bfff' // DeepSkyBlue
        const color = noPubAddr? noPubAddrColor : baseColor

        style = new Style({
          image: new Icon({
            img: isFiltered ? this.getActiveMarkerImg(color) : this.getInactiveMarkerImg(),
            imgSize: [48, 48],
            anchor: [0.5, 1]
          })
        });
      }
    }
    return style;
  }

  /**
   * updates map size when the map container resizes (the resize observer's callback function)
   */
  resizeMapContainer(): void {
    this.map?.updateSize();
  }

  /**
   * handles the event when the user clicks directly onto the map
   * @param event ol event
   */
  mapClickHandler = (event: any) => {
    if (this.map) {
      const feature = this.map.forEachFeatureAtPixel(event.pixel,
        (f: Feature<Geometry> | RenderFeature) => {
          return f;
        });
      if (feature) {
        const originalFeatures: Feature[] = getOriginalFeatures(feature) || [];
        if (isClusteredFeature(feature)) {
          this.zoomToClusterExtent(originalFeatures);
        } else {
          const coordinate: { lat: number, lng: number } | undefined = getFeatureCoordinate(feature);
          const id: string | undefined = getFirstOriginalFeatureId(feature);
          if (coordinate?.lat && coordinate?.lng && id) {
            this.handleMarkerClick(coordinate.lat, coordinate.lng, id);
          }
        }
      } else {
        this.removePopup();
        this.popupVisible = false;
        this.popupContentAssociationId = undefined;
      }
    }
    return true;
  }

  /**
   * handles the event of clicking on the close button in the popup
   * @param event click event
   */
  closeButtonClickHandler = (event: MouseEvent) => {
    if (this.popupVisible) {
      this.removePopup();
      this.popupVisible = false;
      this.popupContentAssociationId = undefined;
      return true;
    }
    return false;
  }

  /**
   * handles the event when the user moves the mouse over the map
   * @param event ol event
   */
  mapPointerMoveHandler = (event: any) => {
    if (this.map) {
      const hasFeature = this.map.hasFeatureAtPixel(event.pixel);
      const target = this.map.getTarget();
      if (target && target instanceof HTMLElement) {
        if (hasFeature) {
          target.style.cursor = 'pointer';
        } else {
          target.style.cursor = '';
        }
      }
    }
  };

  /**
   * checks if an association is currently displayed within a clustered feature
   * @param id the association's id
   */
  isDisplayedInACluster(id: string): boolean {
    const allFeatures: Feature<Geometry>[] = this.cluster?.getFeatures() || [];
    const clusteredFeature: Feature<Geometry> | undefined
      = allFeatures?.find((f: Feature<Geometry>) => {
      const ids = getOriginalFeaturesIds(f);
      if (!ids || ids.length <= 1) {
        return false;
      }
      return ids.includes(id);
    });
    if (clusteredFeature) {
      const originalFeatures = getOriginalFeatures(clusteredFeature);
      if (originalFeatures) {
        const length = originalFeatures.length;
        return originalFeatures && !!length && (length > 1);
      }
    }
    return false;
  }

  /**
   * get the extent to fit all features of a cluster into the viewport
   * @param originalFeatures list of features in a cluster
   */
  getClusterExtent(originalFeatures: Feature<Geometry>[]): Extent {
    const extent: Extent = createEmpty();
    originalFeatures.forEach((f: any) => {
      extend(extent, f.getGeometry().getExtent());
    });
    return extent;
  }

  /**
   * zoom the map view to a new viewport so that all features of a cluster fit onto the screen
   * @param originalFeatures list of features in a cluster
   */
  zoomToClusterExtent(originalFeatures: any): void {
    if (this.map) {
      const extent = this.getClusterExtent(originalFeatures)
      this.map.getView().fit(extent, {
        size: this.map.getSize(),
        padding: [72, 48, 24, 48],
        duration: this.SIDEBAR_ANIMATION_DURATION * 2
      });
    }
  }

  /**
   * handles clicking onto a marker features
   * @param lat association's latitude
   * @param lng association's longitude
   * @param id association's id
   */
  handleMarkerClick(lat: number, lng: number, id: string): void {
    this.togglePopupOverlay(lat, lng, id);
  }

  /**
   * filters the association list (filtered by search string, activity options and district options).
   * @param queryString if the filter operation is triggered by a change event in the autocomplete input, use the input query string to
   * filter the associations.
   */
  filterAssociations(queryString?: string): boolean {
    this.blocked = true;
    this.loadingText = 'Vereinsdaten durchsuchen...';
    const previousFilteredResult = this.filteredAssociations;
    let filteredResult: Association[] = [];

    if (!queryString) {
      queryString = this.autoComplete?.inputEL?.nativeElement?.value;
    }

    if (!queryString) {
      filteredResult = this.associations;
    } else {
      filteredResult = this.associations
        .filter((s: Association) => {
          const q: string = queryString ? queryString.toLowerCase() : '';
          return s.name.toLowerCase().includes(q)
            || s.shortName?.toLowerCase().includes(q)
            || s.street?.toLowerCase().includes(q)
            || s.postcode?.toLowerCase().includes(q)
            || s.city?.toLowerCase().includes(q)
            || s.country?.toLowerCase().includes(q)
            || s.goals?.text?.toLowerCase().includes(q)
            || s.activities?.text?.toLowerCase().includes(q)
            || s.contacts?.some((contact: Contact) =>
              contact.name?.toLowerCase().includes(q)
              || contact.phone?.toLowerCase().includes(q)
              || contact.fax?.toLowerCase().includes(q)
              || contact.mail?.toLowerCase().includes(q)
            )
            || s.links?.some((link: Link) =>
              link.url.toLowerCase().includes(q)
              || link.linkText?.toLowerCase().includes(q)
            ) || s.socialMedia?.some((socialMedia: SocialMediaLink) =>
              socialMedia.url.toLowerCase().includes(q)
              || socialMedia.linkText?.toLowerCase().includes(q)
              || socialMedia.platform?.toLowerCase().includes(q)
            ) || s.images?.some((image: Image) =>
              image.url.toLowerCase().includes(q)
              || image.altText?.toLowerCase().includes(q)
            );
        });
    }

    if (this.selectedActivities?.length || this.selectedDistricts?.length) {

      filteredResult = filteredResult.filter((s: Association) => {
        let filtered = true;
        if (this.selectedDistricts?.length) {
          filtered = s.districtList?.some((value: any) =>
            this.selectedDistricts.includes(value)
          ) ?? false;
          if (!filtered) {
            return filtered;
          }
        }

        if (this.selectedActivities?.length) {
          filtered = s.activityList?.some((value: any) =>
            this.selectedActivities.includes(value)
          ) ?? false;
        }
        return filtered;
      });
    }
    this.filteredAssociations = filteredResult;
    if (JSON.stringify(filteredResult) !== JSON.stringify(previousFilteredResult)) {
      if (this.clusterLayer) {
        this.updateClusterLayerStyle();
      }
    }
    this.blocked = false;
    return true;
  }

  /**
   * update cluster layer style and check a view times to update the map correctly
   */
  updateClusterLayerStyle(): void {
    // BUG FIX: after the cluster layer style changed,
    // render the map a few times to prevent markers from disappearing with no replacement
    this.clusterLayer?.setStyle(this.getAnimatedClusterStyle);
    for (let i = 0; i <= 1500; i += 100) {
      setTimeout(() => {
        this.clusterLayer?.changed();
      }, i);
    }
  }

  /**
   * returns only the sub options for an array of selected options
   * @param selectedItems an array of ids
   * @param options the options array
   */
  getSubOptions(selectedItems: string[], options: DropdownOption[]): string[] {
    return selectedItems.filter((s: string) => {
      const option = options.find((o: DropdownOption) => o.value === s);
      return option && !!option.category;
    });
  }


  /**
   * adds a new marker feature to the cluster on the map
   * @param lat latitude of position
   * @param lng longitude of position
   * @param id association id
   */
  private addMarker(lat: number, lng: number, id: string): void {
    const pos = fromLonLat([lng, lat]);

    const newFeature = new Feature(new Point(pos));
    newFeature.setId(id);
    this.clusterFeatures.push(newFeature);

    if (!this.clusterSource) {
      this.clusterSource = new VectorSource({
        features: this.clusterFeatures
      });
    }

    if (!this.cluster) {
      this.cluster = new Cluster({
        distance: 50,
        source: this.clusterSource
      });
    }

    this.clusterSource.addFeature(newFeature);
    this.cluster.setSource(this.clusterSource);
  }

  /**
   * return the active marker image element as an svg-path element. The colors
   * cannot be in the hex format. Either color-name or RGBA formats are allowed, WTF?
   */
  getActiveMarkerImg(hexFillColor : string): HTMLImageElement {
    const markerImg: HTMLImageElement = this.renderer2.createElement('img');
    const fill = hexToRgba(hexFillColor)
    const svg =
      '<svg xmlns="http://www.w3.org/2000/svg">'+
      '<path fill="'+fill+'" stroke="white" stroke-width="0.50744" d="M 34.58637,33.56877 C 36.5425,30.96358 37.74628,27.7965 37.74628,24.27184 37.74628,15.99655 31.1255,9.25372 23,9.25372 c -8.1255,0 -14.74628,6.74283 -14.74628,15.01812 0,3.52466 1.25394,6.69174 3.15992,9.29693 C 14.37293,37.50208 23,48.58688 23,48.58688 c 0,0 8.62708,-11.0848 11.58637,-15.01811 z" id="path212" />'+
      '<circle style="fill:white;fill-rule:evenodd" id="path116" cx="23" cy="23.642452" r="5.6927967" />'+
      '</svg>';
    // console.log(attr)

    const attr = 'data:image/svg+xml;utf-8,'+svg;
    markerImg.setAttribute('src', attr);
    return markerImg;
  }

  /**
   * return the inactive marker image element (gray marker)
   */
  getInactiveMarkerImg(): HTMLImageElement {
    const markerImg: HTMLImageElement = this.renderer2.createElement('img');
    markerImg.setAttribute('src', 'assets/marker-inactive-small.png');
    return markerImg;
  }

  /**
   * selects an association and toggles its popup overlay
   * @param association the association to select
   */
  selectAssociation(association: Association): void {
    const zoomIn = this.isDisplayedInACluster(association.id);
    this.togglePopupOverlay(association.lat, association.lng, association.id, zoomIn);
  }

  /**
   * shows or hides a popup containing the association's data
   * @param lat latitude of position
   * @param lng longitude of position
   * @param id association id
   * @param zoomIn zoom to association
   */
  togglePopupOverlay(lat: number, lng: number, id: string, zoomIn: boolean = false): void {
    this.removePopup();

    if (!this.popupVisible || this.popupContentAssociationId !== id) {
      let removeSidebar = false;
      if (this.osmContainer.nativeElement.clientWidth < 360 && this.sidebarExpanded) {
        this.sidebarExpanded = false;
        removeSidebar = true;
      }

      const pos = fromLonLat([lng, lat]);
      this.popup = this.createPopup(pos, id, removeSidebar, zoomIn);
      this.map?.addOverlay(this.popup);
      this.popupVisible = true;
      this.popupContentAssociationId = id;

      // add the listener for the popup close button
      document.getElementById('popup-close')?.addEventListener('click', this.closeButtonClickHandler);

    } else {
      this.popupVisible = false;
      this.popupContentAssociationId = undefined;
    }
  }

  /**
   * removes the currently displayed popup overlay
   */
  removePopup(): boolean {
    if (this.popup && this.map) {
      document.getElementById('popup-close')?.removeEventListener('click', this.closeButtonClickHandler);
      this.map.removeOverlay(this.popup);
      this.popup = undefined;
      return true;
    }
    return false;
  }

  /**
   * creates a new popup overlay
   * @param coordinates latitude, longitude of popup position
   * @param id the society id to later address the specific marker by its id
   * @param sidebarChange whether the sidebar needs to be hidden (small screen sizes)
   * @param zoomIn zoom to association
   */
  createPopup(coordinates: Coordinate, id: string, sidebarChange?: boolean, zoomIn = false): Overlay {
    const sidebarTimeout = sidebarChange ? (this.SIDEBAR_ANIMATION_DURATION / 2) : 0;

    const popupElement: HTMLDivElement = this.renderer2.createElement('div');
    popupElement.setAttribute('class', 'association-container osm-association-container');

    const closeIcon: HTMLElement = this.renderer2.createElement('a');
    closeIcon.setAttribute('class', 'association-container-close-icon');
    closeIcon.setAttribute('id', 'popup-close');
    closeIcon.setAttribute('style', 'cursor: pointer;');
    closeIcon.innerHTML = `<i class="pi pi-times"></i>`;
    popupElement.appendChild(closeIcon);

    const association: Association | undefined = this.associations.find((s: Association) => s.id === id);
    if (association) {
      popupElement.innerHTML += this.getPopupContent(association);
    }

    // trigger re-center map to the newly opened popup's position
    setTimeout(() => {
      const size = this.map?.getSize();
      const zoom = zoomIn ? 20 : this.map?.getView().getZoom();
      if (this.map && size) {
        const mapContainer: HTMLElement | null = document.getElementById('osm-map');
        const horizontalCenter = mapContainer
          ? (mapContainer.clientWidth / 2)
          : (this.osmContainer.nativeElement.clientWidth / 2);
        const verticalCenter = mapContainer
          ? (mapContainer.clientHeight * 0.975)
          : (this.osmContainer.nativeElement.clientHeight * 0.975);
        const positioning = [horizontalCenter, verticalCenter];
        this.animateViewTo(coordinates, size, positioning, zoom);
      }
    }, sidebarTimeout);

    return new Overlay({
      position: coordinates,
      positioning: OverlayPositioning.BOTTOM_CENTER,
      offset: [0, -56], // -56px to show the popup above its marker (marker is 48px high)
      element: popupElement,
      stopEvent: true,
      className: 'on-top'
    });
  }

  /**
   * animate the map view to a new center
   * @param coordinates latitude, longitude of new position
   * @param size zoom
   * @param positioning screen position
   * @param zoom zoom level
   */
  animateViewTo(coordinates: number[], size: Size, positioning: number[], zoom?: number): void {
    const view = this.map?.getView();
    if (view) {
      const oldCenter = view.getCenter();
      view.centerOn(coordinates, size, positioning);
      const newCenter = view.getCenter();
      view.setCenter(oldCenter);
      view.animate({
        center: newCenter,
        anchor: coordinates,
        duration: this.SIDEBAR_ANIMATION_DURATION * 2
      }, () => {
        view.centerOn(coordinates, size, positioning);
        if (zoom) {
          view.animate({
            anchor: coordinates,
            zoom,
            duration: this.SIDEBAR_ANIMATION_DURATION * 2
          });
        }
      });
    }
  }

  /**
   * returns the html content of the association popup. The html needs to be composed in typescript as we are not able
   * to inject a component as a popup into the OpenLayers map.
   * @param association the association data which needs to be displayed within the popup
   */
  getPopupContent(association: Association): string {
    let content = `<div class="osm-association-inner-container"><div class="association-title"><h2>`;
    content += association.name;
    content += `</h2></div>`;

    if (association.images && association.images.length > 0) {
      content += `<div class="association-images">`;
      for (const img of association.images) {
        content += `<div class="association-image">`;
        content += `<img src="${img.url}" alt="${img.altText}" />`;
        content += `</div>`;
      }
      content += `</div>`;
    }

    content += `<h2>Basisdaten</h2>`;

    if (association.addressLine1 || association.addressLine2 || association.addressLine3
      || association.street || association.postcode || association.city || association.country) {
      content += `<div class="association-address"><h3>Adresse</h3>`;
      if (association.addressLine1) {
        content += `<p class="name"><strong>${association.addressLine1}</strong></p>`;
      }
      if (association.addressLine2) {
        content += `<p class="name">${association.addressLine2}</p>`;
      }
      if (association.addressLine3) {
        content += `<p class="name">${association.addressLine3}</p>`;
      }
      if (association.street) {
        content += `<p class="street">${association.street}</p>`;
      }
      if (association.postcode || association.city) {
        content += `<p class="postcode-city">`;
        content += `${association.postcode ? (association.postcode + ' ') : ''}${association.city}`;
        content += `</p>`;
      }
      if (association.country) {
        content += `<p class="country">${association.country}</p>`;
      }
      content += `</div>`;
    }

    if (association.contacts && association.contacts.length > 0) {
      content += `<div class="association-contacts"><h3>Kontaktinformationen</h3>`;
      for (const contact of association.contacts) {
        content += `<div class="association-contact">`;
        if (contact.name) {
          content += `<p class="name">${contact.name}</p>`;
        }
        if (contact.phone) {
          content += `<div class="association-contact">`;
          content += `<div class="association-contact-row">`;
          content += this.getSocialMediaIcon('phone', false);
          content += `<p class="phone"><a href="${telephoneLink(contact.phone)}">${contact.phone}</a></p></div></div>`;
        }
        if (contact.fax) {
          content += `<div class="association-contact">`;
          content += `<div class="association-contact-row">`;
          content += this.getSocialMediaIcon('fax', false);
          content += `<p class="fax"><a href="${telephoneLink(contact.fax)}">${contact.fax}</a></p></div></div>`;
        }
        if (contact.mail) {
          content += `<div class="association-contact">`;
          content += `<div class="association-contact-row">`;
          content += this.getSocialMediaIcon('mail', false);
          content += `<p class="mail"><a href="mailto:${contact.mail}">${contact.mail}</a></p></div></div>`;
        }
        content += `</div>`;
      }
      content += `</div>`;
    }

    if ((association.goals && association.goals.text !== '') || (association.activities && association.activities.text !== '')) {
      content += `<h2>Beschreibung</h2>`;
    }

    if (association.goals && association.goals.text !== '') {
      content += `<div class="association-description"><h3>Ziele des Vereins</h3>`;
      content += association.goals.text;
      content += `</p></div>`;
    }

    if (association.activities && association.activities.text !== '') {
      content += `<div class="association-description"><h3>Aktivitäten</h3>`;
      content += association.activities.text;
      content += `</p></div>`;
    }

    if (association.links && association.links.length > 0) {
      content += `<div class="association-links"><h3>Links</h3>`;
      for (const link of association.links) {
        content += `<ul>`;
        content += `<li><a href="${link.url}" title="${link.linkText || link.url}" target="_blank">${link.linkText || link.url}</a></li>`;
        content += `</ul>`;
      }
      content += `</div>`;
    }

    if (association.socialMedia && association.socialMedia.length > 0) {
      content += `<div class="association-social-media"><h3>Social Media</h3>`;
      for (const socialMedia of association.socialMedia) {
        content += `<div class="social-media-link">`;
        content += this.getSocialMediaIcon(socialMedia.platform);
        content += `<a href="${socialMedia.url}" title="${socialMedia.linkText || socialMedia.platform}" target="_blank">${socialMedia.linkText || socialMedia.platform}</a>`;
        content += `</div>`;
      }
      content += `</div>`;
    }

    if (association.districtList && association.districtList.length > 0) {
      content += `<div class="association-active-in"><h3>Aktivitätsgebiete</h3>`;
      content += `<div class="association-chips-container">`;
      for (const activeIn of getSubOptions(this.districtOptions, association.districtList)) {
        content += `<div class="association-chips">`;
        content += activeIn.label;
        content += `</div>`;
      }
      content += `</div>`;
      content += `</div>`;
    }

    return content;
  }

  /**
   * returns the html element containing social media links (including icon)
   * @param platform the social media platform
   * @param alt whether to add an alt attribute to the image
   */
  getSocialMediaIcon(platform?: SocialMediaPlatform | string, alt = true): string {
    if (!platform || platform === '' || platform === SocialMediaPlatform.OTHER || platform === 'Other') {
      return '';
    }
    return `<div class="social-media-icon mini-icon"><img src="assets/${platform.toLowerCase()}.png" alt="${alt ? platform : ''}"/></div>`;
  }

  /**
   * toggles visibility of advanced search filters
   */
  toggleAdvancedSearchFilters(): void {
    this.advancedSearchVisible = !this.advancedSearchVisible;
  }

  /**
   * select districts (advanced search)
   * @param value the districts selected from the grouped multi-select component
   */
  selectDistricts(value: any): void {
    this.selectedDistricts = value;
    this.filterAssociations();
  }

  /**
   * select activities (advanced search)
   * @param value the activities selected from the grouped multi-select component
   */
  selectActivities(value: any): void {
    this.selectedActivities = value;
    this.filterAssociations();
  }

  /**
   * clears all search filters
   */
  clearFilters(): void {
    this.selectedDistricts = [];
    this.selectedActivities = [];
    this.clearAutocomplete();
    this.filterAssociations();
  }

  /**
   * clears the autocomplete search string value
   */
  clearAutocomplete(): void {
    this.autoComplete?.writeValue('');
    this.filterAssociations('');
  }

  /**
   * resets the districts filter
   */
  resetDistrictsFilter(): void {
    this.selectedDistricts = [];
    this.filterAssociations();
  }

  /**
   * resets the activities filter
   */
  resetActivitiesFilter(): void {
    this.selectedActivities = [];
    this.filterAssociations();
  }

  /**
   * removes event listeners
   */
  ngOnDestroy(): void {
    document.getElementById('popup-close')?.removeEventListener('click', this.closeButtonClickHandler);
  }
}

/**
 * returns a valid telephone number only consisting of '+' and numbers
 * @param input telephone number string
 */
export function telephoneLink(input: string): string {
  let output = 'tel:';
  const num = input.match(/\d/g);
  if (!num) {
    return '';
  }
  let processedNum: string = num.join('');
  // TODO support other countries
  if (processedNum.startsWith('0049')) {
    processedNum = processedNum.replace('0049', '+49');
  } else if (processedNum.startsWith('0')) {
    processedNum = processedNum.replace('0', '+49');
  }
  output += processedNum;
  return output;
}
