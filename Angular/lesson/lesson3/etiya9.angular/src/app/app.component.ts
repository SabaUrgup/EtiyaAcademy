import { TodoListComponent } from './shared/components/todo-list/todo-list.component';
import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { NavbarComponent } from './shared/components/navbar/navbar.component';
import { FooterComponent } from './shared/components/footer/footer.component';

// SPA => Single Page Application
@Component({
  selector: 'app-root', // Componentlar diğer comp. içerisinde kullanılabilir, bu alan nasıl çağıralacağını belirler.
  standalone: true, // Angular 18 öncesi componentlar bir modüle bağlı olmak zorunda idi, artık bağımsız component..
  imports: [RouterOutlet, NavbarComponent, FooterComponent, TodoListComponent], // bu component angularda diğer özelliklerin hangilerini import ediyor?
  templateUrl: './app.component.html', // hangi HTML ile çalışacak?
  styleUrls: ['./app.component.scss'], // Hangi stil(ler) ile çalışacak?
})
export class AppComponent {
  title = 'etiya9.angular';
}
