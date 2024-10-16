import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { GetToDoListResponse } from '../models/getToDoListResponse';

@Injectable({
  providedIn: 'root',
})
export class TodoService {
  private apiUrl = 'https://jsonplaceholder.typicode.com/todos';

  constructor(private http: HttpClient) {}

  fetchTodos(): Observable<GetToDoListResponse[]> {
    return this.http.get<GetToDoListResponse[]>(this.apiUrl);
  }

  fetchTodoDetail(id: number): Observable<GetToDoListResponse> {
    return this.http.get<GetToDoListResponse>(`${this.apiUrl}/${id}`);
  }

  addToDo(todo: Partial<GetToDoListResponse>): Observable<GetToDoListResponse> {
    return this.http.post<GetToDoListResponse>(this.apiUrl, todo);
  }

  getToDoById(id: number): Observable<GetToDoListResponse> {
    return this.http.get<GetToDoListResponse>(`${this.apiUrl}/${id}`);
  }

  deleteToDo(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
