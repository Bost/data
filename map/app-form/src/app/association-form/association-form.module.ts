import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {AssociationFormComponent} from './association-form.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {InputTextModule} from 'primeng/inputtext';
import {DropdownModule} from 'primeng/dropdown';
import {InputTextareaModule} from 'primeng/inputtextarea';
import {ButtonModule} from 'primeng/button';
import {SharedModule} from '../shared/shared.module';
import {AssociationEditFormComponent} from './association-edit-form/association-edit-form.component';
import {BlockUIModule} from 'primeng/blockui';
import {ProgressSpinnerModule} from 'primeng/progressspinner';
import {SidebarModule} from 'primeng/sidebar';
import {ConfirmDialogModule} from 'primeng/confirmdialog';
import { OptionsEditFormComponent } from './options-edit-form/options-edit-form.component';
import {RouterModule} from '@angular/router';
import {MenubarModule} from 'primeng/menubar';
import {CheckboxModule} from 'primeng/checkbox';
import {InputSwitchModule} from 'primeng/inputswitch';
import {FileUploadModule} from 'primeng/fileupload';


@NgModule({
  declarations: [AssociationFormComponent, AssociationEditFormComponent, OptionsEditFormComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    InputTextModule,
    DropdownModule,
    InputTextareaModule,
    ButtonModule,
    SharedModule,
    BlockUIModule,
    ProgressSpinnerModule,
    SidebarModule,
    ConfirmDialogModule,
    RouterModule,
    MenubarModule,
    CheckboxModule,
    InputSwitchModule
    ,FileUploadModule
  ]
})
export class AssociationFormModule {

}
