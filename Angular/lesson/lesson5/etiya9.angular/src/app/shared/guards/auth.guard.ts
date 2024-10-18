import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { StorageService } from '../services/storage.service';

export const authGuard: CanActivateFn = (route, state) => {
  console.log('Guard kontrolü yapılıyor..');

  const router = inject(Router);
  const storageService = inject(StorageService);

  const token = storageService.get('token');
  if (!token) {
    router.navigateByUrl('/login');
    return false;
  }
  return true;
};
