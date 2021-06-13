import {Component, EventEmitter, Input, OnChanges, OnDestroy, Output, SimpleChanges, ViewChild} from '@angular/core';
import {SocialMediaPlatform, Association} from '../../model/association';
import {AbstractControl, FormArray, FormBuilder, FormControl, FormGroup, ValidatorFn, Validators} from '@angular/forms';
import {DropdownOption, getSubOptions} from '../../model/dropdown-option';
import {v4 as uuidv4} from 'uuid';
import {MysqlPersistService} from '../../services/mysql-persist.service';
import {ConfirmationService, MessageService} from 'primeng/api';
import {MyHttpResponse} from '../../model/http-response';
import {MysqlQueryService} from '../../services/mysql-query.service';
import {BehaviorSubject, Subscription} from 'rxjs';
import {InputSwitch} from 'primeng/inputswitch';
// import {LoginService} from '../../login/login.service';

// import * as o from './ods-table/ods'
// import * as g from './ods-table/geo'
import {getAssociations} from './../../services/ods-table/json'
import * as XLSX from 'xlsx'

function contactFilledValidator(): ValidatorFn {
  return (control: FormGroup): { [key: string]: boolean } | null => {
    if (!control.value.name && !control.value.phone && !control.value.fax && !control.value.mail) {
      return {contactfilled: true};
    }
    return null;
  };
}

const urlPattern = /^(?:(?:(?:https?|ftp):)?\/\/)(?:\S+(?::\S*)?@)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:[/?#]\S*)?$/i;

function getEmptyFormArrayElement(type: 'contact' | 'link' | 'socialMedia' | 'image', associationId: string): FormGroup {
  switch (type) {
    case 'contact':
      return new FormGroup({
        id: new FormControl(uuidv4()),
        name: new FormControl(''),
        phone: new FormControl(''),
        fax: new FormControl(''),
        mail: new FormControl(''),
        associationId: new FormControl(associationId)
      }, contactFilledValidator());
    case 'link':
      return new FormGroup({
        id: new FormControl(uuidv4()),
        url: new FormControl('http://', [Validators.required, Validators.pattern(urlPattern)]),
        linkText: new FormControl(''),
        associationId: new FormControl(associationId)
      });
    case 'socialMedia':
      return new FormGroup({
        id: new FormControl(uuidv4()),
        url: new FormControl('http://', [Validators.required, Validators.pattern(urlPattern)]),
        linkText: new FormControl(''),
        platform: new FormControl('Facebook'),
        associationId: new FormControl(associationId)
      });
    case 'image':
      return new FormGroup({
        id: new FormControl(uuidv4()),
        url: new FormControl('http://', [Validators.required, Validators.pattern(urlPattern)]),
        altText: new FormControl(''),
        associationId: new FormControl(associationId)
      });
  }
  return new FormGroup({});
}

@Component({
  selector: 'app-association-edit-form',
  templateUrl: './association-edit-form.component.html',
  styleUrls: ['./association-edit-form.component.scss'],
  providers: [
    MessageService,
    ConfirmationService
  ]
})
export class AssociationEditFormComponent implements OnChanges, OnDestroy {
  initialFormState: any = {};

  associations: Association[] = [];
  association?: Association;

  @Output() reload: EventEmitter<{ id: string | undefined, showDialog: boolean | undefined }>
    = new EventEmitter<{ id: string | undefined, showDialog: boolean | undefined }>();

  // @ts-ignore
  @Input() selectedAssociationId: string = [];

  @Input() isNew = true;

  // @ts-ignore
  associationForm: FormGroup;
  // @ts-ignore
  goalsForm: FormGroup;
  // @ts-ignore
  activityForm: FormGroup;

  districtOptions: DropdownOption[] = [];
  activitiesOptions: DropdownOption[] = [];

  isPublicAddress = false;

  uploadedFiles: any[] = [];

  get showPreview(): boolean {
    return localStorage.getItem('show-preview') === 'true';
  }

  set showPreview(val: boolean) {
    const stringVal: string = val ? 'true' : 'false';
    localStorage.setItem('show-preview', stringVal);
  }

  editFormChanges$: BehaviorSubject<string> = new BehaviorSubject<string>(null);

  @Output() blockUi: EventEmitter<{ block: boolean, message?: string }> = new EventEmitter<{ block: boolean, message?: string }>();

  readonly socialMediaOptions = Object.keys(SocialMediaPlatform)
    // @ts-ignore
    .map(key => SocialMediaPlatform[key] as string)
    .map((s: string) => {
      return {
        value: s,
        label: s === 'Other' ? 'Andere Plattform' : s
      };
    });

  private editFormStatusChangesSub: Subscription | undefined;

  @ViewChild(InputSwitch) publicAddressSwitch?: InputSwitch;

  get hasFormValueChanged(): boolean {
    return JSON.stringify(this.associationForm?.value) !== JSON.stringify(this.initialFormState);
  }

  constructor(private formBuilder: FormBuilder,
              private mySqlQueryService: MysqlQueryService,
              private mySqlPersistService: MysqlPersistService,
              private confirmationService: ConfirmationService,
              private messageService: MessageService
              // , private loginService: LoginService
             ) {
  }

  /**
   * when the id of the selected association changes, re-init the form and the form values
   * @param changes SimpleChanges
   */
  async ngOnChanges(changes: SimpleChanges): Promise<void> {
    if ((changes.selectedAssociationId && changes.selectedAssociationId.previousValue !== changes.selectedAssociationId.currentValue)
      || changes.isNew) {
      await this.initForm();
    }
  }

  getSubOptions(optionList: any[], selectedOptions: any[]): any[] {
    return getSubOptions(optionList, selectedOptions);
  }

  /**
   * queries all associations, fill in the edited association data into the form
   */
  private async initForm(): Promise<void> {
    this.emitBlockUi(true, 'Verein wird abgerufen...');

    this.districtOptions = (await this.mySqlQueryService.getDistrictOptions())?.data || [];
    this.activitiesOptions = (await this.mySqlQueryService.getActivitiesOptions())?.data || [];

    if (!this.isNew) {
      const httpResponse: MyHttpResponse<Association[]> = (await this.mySqlQueryService.getAssociations());
      this.associations = httpResponse?.data?.sort(
        (a: Association, b: Association) =>
          a.name.toLowerCase() > b.name.toLowerCase() ? 1 : (a.name.toLowerCase() < b.name.toLowerCase() ? -1 : 0)
      ) || [];
      if (!this.associations.length) {
        this.messageService.add({
          severity: 'error',
          summary: 'Fehler beim Abrufen der Vereine',
          detail: httpResponse?.errorMessage || '',
          key: 'formToast'
        });
        this.emitBlockUi(false);
        return;
      } else {
        this.association = this.associations.find((s: Association) => s.id === this.selectedAssociationId);
        if (!this.association) {
          this.messageService.add({
            severity: 'error',
            summary: 'Fehler beim Abrufen des Vereins',
            detail: `Der Verein mit der id ${this.selectedAssociationId}} konnte nicht in der Datenbank gefunden werden.`,
            key: 'formToast'
          });
          this.emitBlockUi(false);
          return;
        }
      }
    } else {
      this.association = {
        id: uuidv4(),
        name: '',
        lat: 48.77860400126555,
        lng: 9.179747886339912,
      };
    }

    const id = this.association.id || uuidv4();

    this.goalsForm = new FormGroup({
      format: new FormControl(this.association?.goals?.format || 'plain'),
      text: new FormControl(this.association?.goals?.text || '')
    });

    this.activityForm = new FormGroup({
      format: new FormControl(this.association?.activities?.format || 'plain'),
      text: new FormControl(this.association?.activities?.text || '')
    });

    this.associationForm = new FormGroup({
      id: new FormControl(id),
      name: new FormControl(this.association?.name || '', Validators.required),
      shortName: new FormControl(this.association?.shortName || '', [Validators.maxLength(50)]),
      lat: new FormControl(this.association?.lat || 0, [Validators.required, Validators.min(-90), Validators.max(90)]),
      lng: new FormControl(this.association?.lng || 0, [Validators.required, Validators.min(-180), Validators.max(180)]),
      addressLine1: new FormControl(this.association?.addressLine1 || ''),
      addressLine2: new FormControl(this.association?.addressLine2 || ''),
      addressLine3: new FormControl(this.association?.addressLine3 || ''),
      street: new FormControl(this.association?.street || ''),
      postcode: new FormControl(this.association?.postcode || ''),
      city: new FormControl(this.association?.city || ''),
      country: new FormControl(this.association?.country || ''),
      contacts: new FormArray([]),
      images: new FormArray([]),
      links: new FormArray([]),
      socialMedia: new FormArray([]),
      goals: this.goalsForm,
      activities: this.activityForm,
      districtList: new FormControl(this.association?.districtList || []),
      activityList: new FormControl(this.association?.activityList || [])
    });

    if (this.association?.contacts?.length) {
      const contactControl = (this.associationForm.controls.contacts as FormArray);

      this.association.contacts.forEach(contact => {
        contactControl.push(this.formBuilder.group({
          id: new FormControl(contact.id || uuidv4()),
          name: new FormControl(contact.name || ''),
          phone: new FormControl(contact.phone || ''),
          fax: new FormControl(contact.fax || ''),
          mail: new FormControl(contact.mail || '')
        }, {validators: contactFilledValidator()}));
      });
    } else {
      if (this.isNew) {
        this.formArrayAdd(this.associationForm.controls.contacts as FormArray, 'contact', this.associationForm.value.id);
      }
    }

    if (this.association?.links?.length) {
      const linkControl = (this.associationForm.controls.links as FormArray);

      this.association.links.forEach(link => {
        linkControl.push(this.formBuilder.group({
          id: new FormControl(link.id || uuidv4()),
          url: new FormControl(link.url || 'http://', [Validators.required, Validators.pattern(urlPattern)]),
          linkText: new FormControl(link.linkText)
        }));
      });
    }

    if (this.association?.socialMedia?.length) {
      const socialMediaControl = (this.associationForm.controls.socialMedia as FormArray);

      this.association?.socialMedia.forEach(link => {
        socialMediaControl.push(this.formBuilder.group({
          id: new FormControl(link.id || uuidv4()),
          url: new FormControl(link.url || 'http://', [Validators.required, Validators.pattern(urlPattern)]),
          linkText: new FormControl(link.linkText),
          platform: new FormControl(link.platform || 'Facebook')
        }));
      });
    }

    if (this.association?.images?.length) {
      const imageControl = (this.associationForm.controls.images as FormArray);

      this.association?.images.forEach(image => {
        imageControl.push(this.formBuilder.group({
          id: new FormControl(image.id || uuidv4()),
          url: new FormControl(image.url || 'http://', [Validators.required, Validators.pattern(urlPattern)]),
          altText: new FormControl(image.altText)
        }));
      });
    }

    // update the forms validation
    this.associationForm.updateValueAndValidity();

    // disable address field if no public address
    this.isPublicAddress = !(
      this.associationForm.value.street === ''
      && this.associationForm.value.postcode === ''
      && this.associationForm.value.city === ''
      && this.associationForm.value.addressLine2 === ''
      && this.associationForm.value.addressLine1.toLowerCase() === 'Keine öffentliche Anschrift'.toLowerCase()
    );
    this.requestChangePublicAddress(this.isPublicAddress);

    this.initialFormState = this.associationForm?.value;

    this.editFormStatusChangesSub = this.associationForm.statusChanges.subscribe((value) => {
      this.editFormChanges$.next(value);
    });

    this.emitBlockUi(false);
  }

  myUploader(event) {
      for(let file of event.files) {
          // console.log("myUploader file: "+file)
          this.uploadedFiles.push(file)
          const reader: FileReader = new FileReader()
          const bs = reader.readAsBinaryString(file)
          reader.onload = (e) => {
              const binaryResult = reader.result
              const wb: XLSX.WorkBook = XLSX.read(binaryResult, { type: 'binary' })

              const wsname: string = wb.SheetNames[0]
              const ws: XLSX.WorkSheet = wb.Sheets[wsname]

              // const data = XLSX.utils.sheet_to_json(ws) // to get 2d array pass 2nd parameter as object {header: 1}
              // console.log(data) // Data will be logged in array format containing objects
              const assocs : Association[] = getAssociations(ws)
              console.log("assocs.length: " + assocs.length)

              for(let a of assocs) {
                  this.mySqlPersistService.createOrUpdateAssociation(a).toPromise()
                      .then(() => {
                          this.emitBlockUi(false);
                          this.messageService.add({
                              severity: 'success',
                              summary: a.name + ' gespeichert.',
                              key: 'editFormToast'
                          });
                          // console.log("Saved: "+a.name)
                          this.reload.emit({id: this.associationForm.value.id, showDialog: false});
                      })
                      .catch((reason) => {
                          this.emitBlockUi(false);
                          this.messageService.add({
                              severity: 'error',
                              summary: a.name + ' konnte nicht gespeichert werden.',
                              detail: JSON.stringify(reason),
                              key: 'editFormToast'
                          });
                      });
              }
          }
      }
  }

  requestChangePublicAddress(val: boolean): void {
    const prevValue = this.isPublicAddress;

    const someAddressInputFilled = !(
      this.associationForm.value.street === ''
      && this.associationForm.value.postcode === ''
      && this.associationForm.value.city === ''
      && this.associationForm.value.addressLine2 === ''
      && (this.associationForm.value.addressLine1 === ''
        || this.associationForm.value.addressLine1.toLowerCase() === 'Keine öffentliche Anschrift'.toLowerCase()
      )
    );

    if (!someAddressInputFilled || !!val) {
      this.changePublicAddress(val);
      this.writePublicAddressSwitchValue(this.isPublicAddress);
      return;
    }

    this.confirmationService.confirm({
      header: 'Adresse löschen?',
      message: 'Bereits eingegebene Adressdaten werden aus dem Formular gelöscht<br>und müssen gegebenenfalls neu eingegeben werden.',
      acceptLabel: 'OK',
      rejectLabel: 'Abbrechen',
      closeOnEscape: true,
      accept: async () => {
        this.changePublicAddress(val);
        if (this.publicAddressSwitch) {
          this.writePublicAddressSwitchValue(this.isPublicAddress);
        }
      },
      reject: () => {
        this.isPublicAddress = prevValue;
        if (this.publicAddressSwitch) {
          this.writePublicAddressSwitchValue(this.isPublicAddress);
        }
      }
    });
  }

  writePublicAddressSwitchValue(val: boolean): void {
    setTimeout(() => {
      if (this.publicAddressSwitch) {
        this.publicAddressSwitch.writeValue(val);
      }
    });
  }

  changePublicAddress(val: boolean): void {
    this.isPublicAddress = val;
    if (!val) {
      this.associationForm.controls.street.setValue('');
      this.associationForm.controls.street.disable();
      this.associationForm.controls.postcode.setValue('');
      this.associationForm.controls.postcode.disable();
      this.associationForm.controls.city.setValue('');
      this.associationForm.controls.city.disable();
      this.associationForm.controls.country.setValue('');
      this.associationForm.controls.country.disable();
      this.associationForm.controls.addressLine1.setValue('Keine öffentliche Anschrift');
      this.associationForm.controls.addressLine1.disable();
      this.associationForm.controls.addressLine2.setValue('');
      this.associationForm.controls.addressLine2.disable();
      this.associationForm.controls.addressLine3.setValue('');
      this.associationForm.controls.addressLine3.disable();
    } else {
      this.associationForm.controls.street.enable();
      this.associationForm.controls.postcode.enable();
      this.associationForm.controls.city.enable();
      this.associationForm.controls.country.enable();
      this.associationForm.controls.addressLine1.enable();
      this.associationForm.controls.addressLine2.enable();
      this.associationForm.controls.addressLine3.enable();
      if (this.associationForm.value.addressLine1.toLowerCase() === ('Keine öffentliche Anschrift'.toLowerCase())) {
        this.associationForm.controls.addressLine1.setValue('');
      }
    }
    this.associationForm.updateValueAndValidity();
  }

  /**
   * returns a form element from a nested form group
   * @param nestedFormGroup the nested form group
   * @param nestedFormControl the control's name
   */
  getNestedFormGroupControl(nestedFormGroup: AbstractControl, nestedFormControl: string): FormControl | undefined {
    try {
      const fg: FormGroup = nestedFormGroup as FormGroup;

      if (fg) {
        return fg.controls[nestedFormControl] as FormControl;
      }
    } catch {
    }
    return undefined;
  }

  /**
   * returns all form groups from a form array
   * @param control the form array control
   */
  getFormGroupsFromFormArray(control: AbstractControl): FormGroup[] | undefined {
    try {
      const fa: FormArray = control as FormArray;

      if (fa) {
        return fa.controls.map((c: AbstractControl) => c as FormGroup);
      }
    } catch {
    }
    return undefined;
  }

  /**
   * get a specific form group from a form array
   * @param array the form array
   * @param index the index of the form group to return
   */
  getFormArrayFormGroup(array: string, index: number): FormGroup | undefined {
    try {
      return ((this.associationForm.controls[array] as FormArray).at(index) as FormGroup);
    } catch {
      return undefined;
    }
  }

  /**
   * remove a element form a form array by its index
   * @param formArray the form array
   * @param i index
   */
  formArrayRemoveAt(formArray: AbstractControl, i: number): void {
    if (formArray as FormArray) {
      (formArray as FormArray).removeAt(i);
    }
  }

  /**
   * adds a form group to a form array
   * @param formArray the form array to add to
   * @param type the type of form group which should be added
   * @param associationId the currently edited association id
   */
  formArrayAdd(formArray: AbstractControl, type: 'contact' | 'link' | 'socialMedia' | 'image', associationId: string): void {
    if (formArray as FormArray) {
      (formArray as FormArray).push(getEmptyFormArrayElement(type, associationId));
    }
  }

  /**
   * checks if a specific form control has a specific error
   * @param control the control to check
   * @param error the error to check for
   */
  public errorHandling(control: string, error: string): boolean {
    return this.associationForm.controls[control].hasError(error);
  }

  /**
   * checks if a specific form group has a specific error
   * @param formGroup the form group control to check
   * @param error the error to check for
   */
  public errorHandlingFormGroup(formGroup: FormGroup, error: string): boolean {
    return formGroup.hasError(error);
  }

  /**
   * checks if a specific form control in a specific form array has a specific error
   * @param array the form array to check
   * @param index the index of the form group to check
   * @param control the control's name to check
   * @param error the error to check for
   */
  public errorHandlingForFormArray(array: string, index: number, control: string, error: string): boolean {
    try {
      return ((this.associationForm.controls[array] as FormArray).at(index) as FormGroup).controls[control].hasError(error);
    } catch {
      return false;
    }
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
   * sets the coordinate form values according to the map click event's coordinates
   * @param event contains the clicked latitude and longitude positions
   */
  mapClick(event: { lat: number, lng: number }): void {
    this.associationForm.controls.lat.setValue(event.lat);
    this.associationForm.controls.lng.setValue(event.lng);
  }

  /**
   * returns a valid coordinate (latitude or longitude). Prevents OpenLayers map from crashing due to latitude or longitude overflow.
   * @param coordinate the coordinate (latitude or longitude)
   * @param max allowed range; e.g. 90 => (-90, 90), 180 => (-180, 180)
   */
  getCoordinate(coordinate: number, max: number): number {
    if (coordinate < (max * -1) || coordinate > max) {
      return 0;
    }
    return coordinate;
  }

  /**
   * resets the form's value and queries the association's data from the database
   * @param id the selected association's id
   */
  async reset(id: string): Promise<void> {
    this.selectedAssociationId = id;
    await this.initForm();
  }

  /**
   * submits form data, creates or updated the edited association
   */
  async submit(): Promise<void> {
    this.emitBlockUi(true, 'Verein wird gespeichert...');

    // const loggedIn = await this.loginService.checkLoginStatus();
    // if (!loggedIn) {
    //   this.messageService.add({
    //     severity: 'error',
    //     summary: 'Berechtigungsfehler',
    //     detail: 'Konnte nicht gespeichert werden. Bitte loggen Sie sich erneut ein.',
    //     key: 'editFormToast'
    //   });
    //   this.emitBlockUi(false);
    //   return;
    // }

    this.associationForm.controls.street.enable();
    this.associationForm.controls.postcode.enable();
    this.associationForm.controls.city.enable();
    this.associationForm.controls.country.enable();
    this.associationForm.controls.addressLine1.enable();
    this.associationForm.controls.addressLine2.enable();
    this.associationForm.controls.addressLine3.enable();
    this.associationForm.updateValueAndValidity();

    await this.mySqlPersistService.createOrUpdateAssociation(this.associationForm.value).toPromise()
      .then(() => {
        this.emitBlockUi(false);
        this.messageService.add({
          severity: 'success',
          summary: 'Verein wurde gespeichert.',
          key: 'editFormToast'
        });
        this.reload.emit({id: this.associationForm.value.id, showDialog: false});
      })
      .catch((reason) => {
        this.emitBlockUi(false);
        this.messageService.add({
          severity: 'error',
          summary: 'Verein konnte nicht gespeichert werden.',
          detail: JSON.stringify(reason),
          key: 'editFormToast'
        });
      });
  }

  /**
   * deletes the selected association from the database
   * @param id the selected association's id
   */
  deleteAssociation(id: string): void {
    this.confirmationService.confirm({
      header: 'Löschen?',
      message: 'Möchten Sie den ausgewählten Verein wirklich löschen?',
      acceptLabel: 'OK',
      rejectLabel: 'Abbrechen',
      closeOnEscape: true,
      accept: async () => {
        this.emitBlockUi(true, 'Verein wird gelöscht...');

        // const loggedIn = await this.loginService.checkLoginStatus();
        // if (!loggedIn) {
        //   this.messageService.add({
        //     severity: 'error',
        //     summary: 'Berechtigungsfehler',
        //     detail: 'Konnte nicht gelöscht werden. Bitte loggen Sie sich erneut ein.',
        //     key: 'editFormToast'
        //   });
        //   this.emitBlockUi(false);
        //   return;
        // }

        await this.mySqlPersistService.deleteAssociation(id).toPromise()
          .then(() => {
            this.emitBlockUi(false);
            this.messageService.add({
              severity: 'success',
              summary: 'Verein wurde gelöscht.',
              key: 'editFormToast'
            });
            this.reload.emit({id: undefined, showDialog: false});
          })
          .catch((reason) => {
            this.emitBlockUi(false);
            this.messageService.add({
              severity: 'error',
              summary: 'Verein konnte nicht gelöscht werden.',
              detail: JSON.stringify(reason),
              key: 'editFormToast'
            });
          });
      }
    });
  }

  /**
   * converts a phone number to a valid string usable in a <a href="tel:..."> link
   * @param input phone number as string
   */
  telephoneLink(input: string): string {
    let output = 'tel:';
    const num = input.match(/\d/g);
    if (!num) {
      return '';
    }
    let processedNum: string = num.join('');
    if (processedNum.startsWith('0049')) {
      processedNum = processedNum.replace('0049', '+49');
    } else if (processedNum.startsWith('0')) {
      processedNum = processedNum.replace('0', '+49');
    }
    output += processedNum;
    return output;
  }

  /**
   * add http:// prefix in url form controls
   * @param urlControl the form control to add the prefix to
   */
  addHttpProtocolToLink(urlControl: AbstractControl): void {
    if (!urlControl.value.startsWith('http://') && !urlControl.value.startsWith('https://')) {
      urlControl.setValue('http://' + urlControl.value);
    }
  }

  /**
   * emits a event for the parent component to block the ui
   * @param block start blocking state (true) or not end blocking state (false)
   * @param message message to display in the ui blocker
   */
  emitBlockUi(block: boolean, message?: string): void {
    this.blockUi.emit({
      block,
      message
    });
  }

  /**
   * reloads the options in a option dropdown
   * @param optionType the option type of the dropdown (districts or activities)
   */
  async reloadOptions(optionType: string): Promise<void> {
    this.emitBlockUi(true, 'Schlagwörter laden...');
    switch (optionType) {
      case 'districts':
        this.districtOptions = (await this.mySqlQueryService.getDistrictOptions())?.data || [];
        break;
      case 'activities':
        this.activitiesOptions = (await this.mySqlQueryService.getActivitiesOptions())?.data || [];
        break;
    }
    this.emitBlockUi(false);
  }

  ngOnDestroy(): void {
    this.editFormStatusChangesSub?.unsubscribe();
  }
}
