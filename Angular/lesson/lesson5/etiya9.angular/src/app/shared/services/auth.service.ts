import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { LoginRequest } from '../models/auth/loginRequest';
import { environment } from '../../../environments/environment';
import { TokenResponse } from '../models/auth/tokenResponse';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  controllerUrl: string = `${environment.MS_V1_API_URL}/auth`;
  constructor(private httpClient: HttpClient) {}
  // any,unknown ❌

  login(loginRequest: LoginRequest): Observable<TokenResponse> {
    return this.httpClient.post<TokenResponse>(
      `${this.controllerUrl}/login`,
      loginRequest
    );
  }
}
