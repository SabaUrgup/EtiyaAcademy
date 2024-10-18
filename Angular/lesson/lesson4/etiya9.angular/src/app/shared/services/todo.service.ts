import { Injectable } from '@angular/core';
import { GetToDoListResponse } from '../models/getToDoListResponse';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment'; // PROD olan import edilmeli.

// Angular bu classı dep. olarak görsün.

@Injectable({
  providedIn: 'root', // ...
})
export class TodoService {
  controllerUrl = `${environment.BASE_API_URL}/todos`;
  constructor(private httpClient: HttpClient) {}

  getAll(): Observable<GetToDoListResponse[]> {
    return this.httpClient.get<GetToDoListResponse[]>(this.controllerUrl, {
      headers: { Authorization: 'Bearer token' },
    });
  }

  getById(id: number): Observable<GetToDoListResponse> {
    // ALT GR + virgül == ``
    return this.httpClient.get<GetToDoListResponse>(
      `${this.controllerUrl}/${id}`,
      {
        headers: { Authorization: 'Bearer token' },
      }
    );
  }
}
// Interceptor
