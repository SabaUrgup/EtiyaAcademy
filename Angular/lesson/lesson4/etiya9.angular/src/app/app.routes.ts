import { Routes } from '@angular/router';
import { TodoListComponent } from './shared/components/todo-list/todo-list.component';
import { HomepageComponent } from './shared/pages/homepage/homepage.component';
import { MainLayoutComponent } from './shared/layouts/main-layout/main-layout.component';

// Lazy Loading
export const routes: Routes = [
  {
    path: '',
    component: MainLayoutComponent,
    children: [
      { path: 'homepage', redirectTo: '' },
      {
        path: '',
        loadComponent: () =>
          import('../app/shared/pages/homepage/homepage.component').then(
            (c) => c.HomepageComponent
          ),
      },
      {
        path: 'todolist',
        loadComponent: () =>
          import('../app/shared/components/todo-list/todo-list.component').then(
            (c) => c.TodoListComponent
          ),
      },
    ],
  },
  {
    path: 'login',
    loadComponent: () =>
      import('../app/shared/pages/login/login.component').then(
        (c) => c.LoginComponent
      ),
  },
  //{path:'/login',component:LoginComponent}
];
