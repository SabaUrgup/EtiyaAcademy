import { CommonModule } from '@angular/common';
import { Component, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { RouterModule } from '@angular/router';
@Component({
  selector: 'app-navbar',
  imports: [CommonModule, FormsModule, RouterModule],
  standalone: true,
  templateUrl: './navbar.component.html', // direkt html'i ts içerisinde yazabiliriz.
  styleUrl: './navbar.component.scss',
})
export class NavbarComponent {
  constructor() {}
  // component lifecycle methods
}
