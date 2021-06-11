import {BrowserModule} from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {AppRoutingModule} from './app-routing.module';
import {AppComponent} from './app.component';
import {BrowserAnimationsModule} from '@angular/platform-browser/animations';
import {AssociationFormModule} from './association-form/association-form.module';
import {HttpClientModule} from '@angular/common/http';
import {ButtonModule} from 'primeng/button';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {AssociationFormDeactivateGuard, OptionsEditFormDeactivateGuard} from './association-form/guard';
import {NotFoundComponent} from './not-found/not-found.component';
// import { LoginComponent } from './login/login.component';
import {ReactiveFormsModule} from '@angular/forms';
import {InputTextModule} from 'primeng/inputtext';
import {BlockUIModule} from 'primeng/blockui';
import {ProgressSpinnerModule} from 'primeng/progressspinner';
import {ToastModule} from 'primeng/toast';
import {FocusTrapModule} from 'primeng/focustrap';
import {FileUploadModule} from 'primeng/fileupload';

@NgModule({
  declarations: [
    AppComponent,
    NotFoundComponent
    // , LoginComponent
  ],
    imports: [
        BrowserModule,
        BrowserAnimationsModule,
        AppRoutingModule,
        HttpClientModule,
        AssociationFormModule,
        ButtonModule,
        NgbModule,
        ReactiveFormsModule,
        InputTextModule,
        BlockUIModule,
        ProgressSpinnerModule,
        ToastModule,
        FocusTrapModule
       ,FileUploadModule
    ],
  bootstrap: [AppComponent],
  providers: [
    AssociationFormDeactivateGuard,
    OptionsEditFormDeactivateGuard
  ]
})
export class AppModule {
}
