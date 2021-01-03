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


@NgModule({
  declarations: [AssociationFormComponent, AssociationEditFormComponent],
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
    ConfirmDialogModule
  ]
})
export class AssociationFormModule {

}
