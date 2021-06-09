import {Component} from '@angular/core';
import {version} from '../../package.json';
// import {LoginService} from './login/login.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'Stadtteilkarte - Daten eingeben';
  version = version;

  // constructor(private loginService: LoginService) {}


  // get loginStatus(): boolean {
  //   return this.loginService.loginStatus;
  // }
}
