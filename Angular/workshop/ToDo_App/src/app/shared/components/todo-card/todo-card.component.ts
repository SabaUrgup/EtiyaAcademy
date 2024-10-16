import { Component, EventEmitter, Input, Output } from '@angular/core';
import { GetToDoListResponse } from '../../models/getToDoListResponse';

@Component({
  selector: 'app-todo-card',
  standalone: true,
  imports: [],
  templateUrl: './todo-card.component.html',
  styleUrl: './todo-card.component.scss',
})
export class TodoCardComponent {
  @Input() toDoFromOtherPage: string = '';
  @Output() onRemoveClick: EventEmitter<string> = new EventEmitter<string>();

  onRemove() {
    this.onRemoveClick.emit(this.toDoFromOtherPage);
  }
}
