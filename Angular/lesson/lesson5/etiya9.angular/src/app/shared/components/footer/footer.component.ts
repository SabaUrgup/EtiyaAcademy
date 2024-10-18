import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { CapitalizePipe } from '../../pipes/capitalize.pipe';

@Component({
  selector: 'app-footer',
  standalone: true,
  imports: [CommonModule, CapitalizePipe],
  templateUrl: './footer.component.html',
  styleUrl: './footer.component.scss',
})
export class FooterComponent {
  today: Date = new Date();
}
