import { Component, OnInit } from '@angular/core';
import { TodoService } from '../../services/todo.service';
import { GetToDoListResponse } from '../../models/getToDoListResponse';
import { FormsModule } from '@angular/forms';
import { TodoCardComponent } from './../todo-card/todo-card.component';

@Component({
  selector: 'app-todo-list',
  standalone: true,
  imports: [FormsModule, TodoCardComponent],
  templateUrl: './todo-list.component.html',
  styleUrl: './todo-list.component.scss',
})
export class TodoListComponent implements OnInit {
  todoList: GetToDoListResponse[] = [];
  newTodoTitle: string = '';
  toDoListFromBackend: GetToDoListResponse[] = [];
  selectedTodoDetail: GetToDoListResponse | null = null;

  public newTodo: string = ''
  constructor(private todoService: TodoService) {}

  ngOnInit(): void {
    this.fetchTodos();
  }

  fetchTodos() {
    this.todoService.fetchTodos().subscribe({
      next: (response: GetToDoListResponse[]) => {
        this.toDoListFromBackend = response;
      },
      error: (err: any) => {
        console.error('Hata:', err);
      },
      complete: () => {
        console.log('To-Do Listesi başarıyla yüklendi.');
      },
    });
  }

  fetchTodoDetail(id: number) {
    this.todoService.fetchTodoDetail(id).subscribe({
      next: (response: GetToDoListResponse) => {
        this.selectedTodoDetail = response;
      },
      error: (err: any) => {
        console.error('Hata:', err);
      },
    });
  }

  add() {
    const newTodo: GetToDoListResponse = {
      userId: 1,
      id: Math.random(), 
      title: this.newTodoTitle,
      completed: false,
    };
    
    this.todoService.addToDo(newTodo).subscribe({
      next: (response: GetToDoListResponse) => {
        this.toDoListFromBackend.push(response);
        this.newTodo = ''; 
      },
      error: (err: any) => {
        console.error('Ekleme Hatası:', err);
      },
    });
  }

  remove(todoId: number) {
    this.todoService.deleteToDo(todoId).subscribe({
      next: () => {
        this.toDoListFromBackend = this.toDoListFromBackend.filter(todo => todo.id !== todoId);
      },
      error: (err: any) => {
        console.error('Silme Hatası:', err);
      },
    });
  }
}
