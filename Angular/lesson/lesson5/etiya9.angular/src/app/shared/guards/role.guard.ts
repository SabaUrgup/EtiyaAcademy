import { CanActivateFn } from '@angular/router';
import { StorageService } from '../services/storage.service';
import { inject } from '@angular/core';
import { jwtDecode } from 'jwt-decode';
export const roleGuard: CanActivateFn = (route, state) => {
  const storageService = inject(StorageService);

  const roles = route.data['requiredRoles'];
  if (roles && roles.length > 0) {
    console.log('Bu sayfa rollerle korunuyor.. Bunu da kontrol et..', roles);
    const token = storageService.get('token');
    const decodedToken = jwtDecode(token!);
    console.log('Decoded token:', decodedToken);
  }
  return true;
};
