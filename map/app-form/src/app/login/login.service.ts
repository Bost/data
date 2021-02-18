import {Injectable} from '@angular/core';
import {WordpressAuthService} from '../services/wordpress-auth.service';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  constructor(private wordpressAuthService: WordpressAuthService) {
    setInterval(async () => {
      if (!!this.token) {
        await this.checkLoginStatus();
      }
    }, 60000);
  }

  get loginStatus(): boolean {
    return !!this.token;
  }

  get token(): string | undefined {
    return localStorage.getItem('wordpress-jwt');
  }

  set token(token: string | undefined) {
    localStorage.setItem('wordpress-jwt', (token || ''));
  }

  async login(username: string, password: string): Promise<boolean> {
    const loginResult = await this.wordpressAuthService.getAuthenticate(username, password);

    if (loginResult && loginResult.success && loginResult.data?.token) {
      this.token = loginResult.data.token;
      return this.checkLoginStatus();
    } else {
      this.token = undefined;
      return false;
    }
  }

  async checkLoginStatus(): Promise<boolean> {
    const validatingResult = await this.wordpressAuthService.getValidateAuthToken(this.token);
    if (!validatingResult?.success) {
      this.token = undefined;
    }
    return !!validatingResult?.success;
  }
}
