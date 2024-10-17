import { HttpClient } from '@angular/common/http';
import { TodoCardComponent } from './../todo-card/todo-card.component';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { GetToDoListResponse } from '../../models/getToDoListResponse';

@Component({
  selector: 'app-todo-list',
  standalone: true,
  imports: [FormsModule, TodoCardComponent],
  templateUrl: './todo-list.component.html',
  styleUrl: './todo-list.component.scss',
})
export class TodoListComponent implements OnInit {
  todoList: string[] = [];
  newTodo: string = '';
  toDoListFromBackend: GetToDoListResponse[] = [];
  // Dependency Injection
  constructor(private httpClient: HttpClient) {}

  ngOnInit() {
    this.fetchTodos();
  }

  add(): void {
    const existingItem = this.todoList.find((i) => i == this.newTodo);
    if (!existingItem && this.newTodo.trim().length > 0)
      this.todoList.push(this.newTodo);
    this.newTodo = '';
  }

  remove(todo: string) {
    this.todoList = this.todoList.filter((i) => i !== todo);
  }

  fetchTodos() {
    // Async, Observable, Subscribe
    this.httpClient
      .get<GetToDoListResponse[]>('https://jsonplaceholder.typicode.com/todos')
      .subscribe({
        next: (response: GetToDoListResponse[]) => {
          this.toDoListFromBackend = response;
        },
        error: (err: any) => {
          console.log('HATA', err);
        },
        complete: () => {
          console.log('istek başarılı bitti');
        },
      });
    // RxJs observable
  }
}
