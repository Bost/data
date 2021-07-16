import {NgModule} from '@angular/core';
import {Routes, RouterModule} from '@angular/router';
import {AssociationFormComponent} from './association-form/association-form.component';
import {OptionsEditFormComponent} from './association-form/options-edit-form/options-edit-form.component';
import {ImportEditFormComponent} from './association-form/import-edit-form/import-edit-form.component';
import {  AssociationFormDeactivateGuard
        , OptionsEditFormDeactivateGuard
        , ImportEditFormDeactivateGuard
       } from './association-form/guard';
import {NotFoundComponent} from './not-found/not-found.component';

export const routes: Routes = [
  {
    path: '',
    redirectTo: '/associations',
    pathMatch: 'full'
  },
  {
    path: 'associations',
    component: AssociationFormComponent,
    canDeactivate: [AssociationFormDeactivateGuard]
  },
  {
    path: 'associations/:associationId',
    component: AssociationFormComponent,
    canDeactivate: [AssociationFormDeactivateGuard]
  },
  {
    path: 'options',
    component: OptionsEditFormComponent,
    canDeactivate: [OptionsEditFormDeactivateGuard]
  },
  {
    path: 'options/:optionType',
    component: OptionsEditFormComponent,
    canDeactivate: [OptionsEditFormDeactivateGuard]
  },
  {
    path: 'import',
    component: ImportEditFormComponent,
    canDeactivate: [ImportEditFormDeactivateGuard]
  },
  {
    path: '**',
    component: NotFoundComponent,
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {
}
