import {Injectable} from '@angular/core';
import {environment} from '../../environments/environment';
import {HttpClient, HttpErrorResponse, HttpHeaders} from '@angular/common/http';
import {Observable, throwError} from 'rxjs';
import {MyHttpResponse} from '../model/http-response';
import {catchError, timeout} from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class WordpressAuthService {
  AUTH_SERVER_BASE_PATH = environment.authApi.basePath;
  CONNECTION_TIMEOUT = 10000;

  constructor(private httpClient: HttpClient) {
  }

  authenticate(username: string, password: string): Observable<any> {
    return this.httpClient.post<MyHttpResponse<any>>(`${this.AUTH_SERVER_BASE_PATH}/jwt-auth/v1/token`, {
      username, password
    })
      .pipe(
        timeout(this.CONNECTION_TIMEOUT),
        catchError(err => {
          console.log(('Authentifizierung fehlgeschlagen.'), err);
          return throwError(err);
        })
      );
  }

  async getAuthenticate(username: string, password: string): Promise<MyHttpResponse<any>> {
    try {
      return await this.authenticate(username, password).toPromise().then(
        (res) => {
          if (!res) {
            return {
              success: false,
              errorMessage: 'Login fehlgeschlagen.'
            };
          }
          return {
            data: res,
            success: true
          };
        },
        (rej: HttpErrorResponse) => {
          return {
            success: false,
            errorMessage: rej.message
          };
        });
    } catch (e) {
      return {
        success: false,
        errorMessage: 'Login fehlgeschlagen: ' + e
      };
    }
  }

  validateAuthToken(token: string): Observable<any> {
    let headers = new HttpHeaders();
    headers = headers.set('Authorization', 'Bearer ' + token);
    return this.httpClient.post(
      `${this.AUTH_SERVER_BASE_PATH}/jwt-auth/v1/token/validate`,
      {},
      {headers: headers}
    ).pipe(
      timeout(this.CONNECTION_TIMEOUT),
      catchError(err => {
        console.log(('Token-Validierung fehlgeschlagen.'), err);
        return throwError(err);
      })
    );
  }

  async getValidateAuthToken(token: string): Promise<MyHttpResponse<any>> {
    return await this.validateAuthToken(token).toPromise().then(
      (res) => {
        if (!res) {
          return {
            success: false,
            errorMessage: 'Token-Validierung fehlgeschlagen.'
          };
        }
        return {
          data: res,
          success: true
        };
      },
      (rej: HttpErrorResponse) => {
        return {
          success: false,
          errorMessage: rej.message
        };
      });
  }
}
