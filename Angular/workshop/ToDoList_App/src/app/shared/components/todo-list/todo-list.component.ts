import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-todo-list',
  standalone: true,
  imports: [FormsModule, CommonModule ],
  templateUrl: './todo-list.component.html',
  styleUrls: ['./todo-list.component.scss']
})
export class TodoListComponent {
  newTodo: string = '';
  todos: string[] = [];

  addTodo() {
    if (this.newTodo && !this.todos.includes(this.newTodo)) {
      this.todos.push(this.newTodo);
    }
    this.newTodo = '';
  }

  removeTodo(index: number) {
    this.todos.splice(index, 1);
  }
}
