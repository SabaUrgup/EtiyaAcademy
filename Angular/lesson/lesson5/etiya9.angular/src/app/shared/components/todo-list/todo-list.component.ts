import { TodoCardComponent } from './../todo-card/todo-card.component';
import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { GetToDoListResponse } from '../../models/getToDoListResponse';
import { TodoService } from '../../services/todo.service';

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
  constructor(private todoService: TodoService) {}

  ngOnInit() {
    this.fetchTodos();
  }

  add(): void {
    const existingItem = this.todoList.find((i) => i == this.newTodo);
    if (!existingItem && this.newTodo.trim().length > 0)
      this.todoList.push(this.newTodo);
    this.newTodo = '';
  }

  remove(todo: string): void {
    this.todoList = this.todoList.filter((i) => i !== todo);
  }

  fetchTodos(): void {
    // Async, Observable, Subscribe,
    // Bu istek uygulamnın bir çok sayfasından çağırılacak..
    this.todoService.getAll().subscribe({
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
