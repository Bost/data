import {Component, OnDestroy, OnInit, ViewChild} from '@angular/core';
import {Association} from '../model/association';
import {MyHttpResponse} from '../model/http-response';
import {ConfirmationService, MenuItem, MessageService} from 'primeng/api';
import {MysqlQueryService} from '../services/mysql-query.service';
import {AssociationEditFormComponent} from './association-edit-form/association-edit-form.component';
import {ActivatedRoute, Router} from '@angular/router';
import {Subscription} from 'rxjs';
// import {LoginService} from '../login/login.service';
import {ExportImportService} from '../services/export-import.service';

@Component({
  selector: 'app-association-form',
  templateUrl: './association-form.component.html',
  styleUrls: ['./association-form.component.scss'],
  providers: [
    MessageService,
    ConfirmationService
  ]
})
export class AssociationFormComponent implements OnInit, OnDestroy {
  associations: Association[] = [];
  selectedAssociation?: Association;
  isNew = true;

  blocked = true;
  loadingText = 'Vereine werden abgerufen...';
  sidebarExpanded = true;

  mainMenuItems: MenuItem[];

  districtOptions = [];
  activitiesOptions = [];

  ignoreRouteParamChange = false;

  sub: Subscription | undefined;

  editFormChangeSub: Subscription | undefined;
  // loginStatusChangeSub: Subscription | undefined;

  @ViewChild('editForm', {static: true}) editForm!: AssociationEditFormComponent;

  constructor(private messageService: MessageService,
              private mySqlQueryService: MysqlQueryService,
              private confirmationService: ConfirmationService,
              private router: Router,
              private route: ActivatedRoute,
              // private loginService: LoginService,
              private exportImportService: ExportImportService) {
    this.mainMenuItems = [
      {
        label: 'Neuen Verein erstellen',
        icon: 'pi pi-plus',
        command: async () => {
          await this.selectAssociation(undefined, true);
        },
        disabled: this.isNew
      },
      {
        label: 'Speichern',
        icon: 'pi pi-save',
        command: async () => {
          await this.submit();
        }
      },
      {
        label: 'Verein löschen',
        icon: 'pi pi-trash',
        command: async () => {
          await this.deleteAssociation();
        },
        disabled: this.isNew
      },
      {
        label: 'Eingaben zurücksetzen',
        icon: 'pi pi-backward',
        command: async () => {
          await this.reset();
        }
      },
      {
        label: 'Vereine neu abrufen',
        icon: 'pi pi-spinner',
        command: async () => {
          await this.reload({id: this.selectedAssociation?.id, showDialog: true});
        }
      },
      {
        label: 'Daten exportieren',
        icon: 'pi pi-download',
        command: async () => {
          await this.export();
        }
      },
      {
        label: 'Schlagwörter bearbeiten',
        icon: 'pi pi-tags',
        items: [
          {
            label: 'Tätigkeitsfelder bearbeiten',
            command: async () => {
              this.editOptions('activities');
            }
          },
          {
            label: 'Aktivitätsgebiete bearbeiten',
            command: async () => {
              this.editOptions('districts');
            }
          }
        ]
      }
      // ,
      // {
      //   label: 'Ausloggen',
      //   icon: 'pi pi-sign-out',
      //   command: async () => {
      //     this.loginService.removeToken();
      //   },
      //   disabled: !this.loginService.loginStatus
      // }
    ];
  }

  async ngOnInit(): Promise<void> {
    await this.init();
  }

  async init(): Promise<void> {
    this.blockUi({block: true, message: 'Vereine werden abgerufen...'});

    // this.loginStatusChangeSub = this.loginService.loginStatusChange$.subscribe((status: boolean) => {
    //   this.mainMenuItems = this.mainMenuItems.map((item: MenuItem) => {
    //     if (item.label === 'Ausloggen') {
    //       return {
    //         ...item,
    //         disabled: !status
    //       };
    //     }
    //     return item;
    //   });
    // });

    const httpResponse: MyHttpResponse<Association[]> = (await this.mySqlQueryService.getAssociations());
    this.associations = httpResponse?.data?.sort(
      (a: Association, b: Association) => {
        const name1 = a.shortName || a.name;
        const name2 = b.shortName || b.name;
        return name1.toLowerCase() > name2.toLowerCase() ? 1 : (name1.toLowerCase() < name2.toLowerCase() ? -1 : 0);
      }) || [];
    if (!this.associations.length) {
      this.messageService.add({
        severity: 'error',
        summary: 'Fehler beim Abrufen der Vereine',
        detail: httpResponse?.errorMessage || '',
        key: 'formToast'
      });
    }

    this.districtOptions = (await this.mySqlQueryService.getDistrictOptions())?.data || [];
    this.activitiesOptions = (await this.mySqlQueryService.getActivitiesOptions())?.data || [];

    this.sub = this.route.params.subscribe(async params => {
      if (params.associationId && !this.ignoreRouteParamChange) {
        if (params.associationId !== this.selectedAssociation?.id) {
          this.selectAssociationById(params.associationId);
        }
      }
      this.ignoreRouteParamChange = false;
    });

    this.editFormChangeSub?.unsubscribe();
    this.editFormChangeSub = this.editForm.editFormChanges$.subscribe(value => {
      this.mainMenuItems = this.mainMenuItems.map((item: MenuItem) => {
        if (item.label === 'Speichern') {
          return {
            ...item,
            disabled: (value !== 'VALID')
          };
        } else {
          return item;
        }
      });
    });

    if (document.documentElement.clientWidth <= 768 && this.sidebarExpanded) {
      this.sidebarExpanded = false;
    }
    this.blockUi({block: false});
  }

  /**
   * queries all associations and reselects the edited association
   */
  async reload(event: { id: string | undefined, showDialog: boolean | undefined }): Promise<void> {
    await this.init();
    if (!event.showDialog || await this.leavePage()) {
      if (event.id) {
        const associationToSelect = this.associations.find((s: Association) => s.id === event.id);
        this.selectAssociation(associationToSelect, false, false);
      } else {
        this.selectAssociation(undefined, true, false);
      }
    }
  }

  /**
   * selects an association to edit
   * @param association the association to edit
   * @param isNew wheter a new association is created or an existing is edited
   * @param showDialog show confirm dialog (discard changes)
   */
  async selectAssociation(association: Association | undefined, isNew = false, showDialog = true): Promise<void> {
    if (!showDialog || await this.leavePage()) {
      this.selectedAssociation = association;
      this.isNew = isNew;
      this.reset(false);
      const id = this.selectedAssociation?.id;
      this.ignoreRouteParamChange = true;

      if (id) {
        await this.router.navigate(['/associations', id]);
      } else {
        await this.router.navigate(['/associations']);
      }

      this.mainMenuItems = this.mainMenuItems.map((item: MenuItem) => {
        if (item.label === 'Neuen Verein erstellen' || item.label === 'Verein löschen') {
          return {
            ...item,
            disabled: this.isNew
          };
        } else {
          return item;
        }
      });

      if (document.documentElement.clientWidth <= 768 && this.sidebarExpanded) {
        this.sidebarExpanded = false;
      }
    }
  }

  /**
   * select an association by its id
   * @param id association id
   */
  async selectAssociationById(id: string): Promise<void> {
    const associationToSelect = this.associations.find((a: Association) => a.id === id);
    if (associationToSelect) {
      await this.selectAssociation(associationToSelect, false, true);
    } else {
      if (this.leavePage()) {
        await this.router.navigate(['/associations']);
      }
    }
  }

  /**
   * toggles the visibility of the sidebar
   */
  toggleSidebar(): void {
    this.sidebarExpanded = !this.sidebarExpanded;
  }

  async submit(): Promise<void> {
    await this.editForm.submit();
  }

  async reset(showDialog = true): Promise<void> {
    if (!showDialog || await this.leavePage()) {
      await this.editForm.reset(this.selectedAssociation?.id);
    }
  }

  async deleteAssociation(): Promise<void> {
    await this.editForm.deleteAssociation(this.selectedAssociation?.id);
  }

  blockUi($event: { block: boolean; message?: string }): void {
    this.blocked = $event.block;
    this.loadingText = $event.message;
  }

  async editOptions(optionType?: 'activities' | 'districts'): Promise<void> {
    if (await this.leavePage()) {
      await this.router.navigate(optionType ? ['/options', optionType] : ['/options']);
    }
  }

  /**
   * deactivate guard
   */
  async canDeactivate(): Promise<boolean> {
    if (!this.ignoreRouteParamChange && !!this.editForm) {
      return await this.leavePage();
    }
    return true;
  }

  /**
   * show dialog on page-leave if something changed in the form
   */
  async leavePage(): Promise<boolean> {
    if (this.editForm.hasFormValueChanged) {
      return new Promise((resolve) => {
        this.confirmationService.confirm({
          header: 'Änderungen verwerfen?',
          message: `Wenn Sie die Seite verlassen, gehen nicht gespeicherte Änderungen verloren.`,
          acceptLabel: 'OK',
          rejectLabel: 'Abbrechen',
          closeOnEscape: true,
          accept: () => {
            resolve(true);
          },
          reject: () => {
            resolve(false);
          }
        });
      });
    } else {
      return true;
    }
  }

  async export(): Promise<void> {
    await this.exportImportService.exportAssociations(this.associations, this.districtOptions, this.activitiesOptions);
  }

  ngOnDestroy(): void {
    this.sub?.unsubscribe();
    this.editFormChangeSub?.unsubscribe();
    // this.loginStatusChangeSub?.unsubscribe();
  }
}
