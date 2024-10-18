import { HttpInterceptorFn } from '@angular/common/http';
import { catchError, finalize, tap } from 'rxjs';

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  // req => request (giden istek)
  // next => isteği devam ettirecek fonksiyon.
  req = req.clone({
    setHeaders: {
      Authorization: `Bearer interceptortoken`,
      'Accept-Language': `en`,
    },
  });
  return next(req).pipe(
    finalize(() => {
      console.log('Interceptor isteğin bitttiğini yakaldı..');
    }),
    catchError((err) => {
      // global hata yönetimi
      console.log('interceptor hata yakaladı:', err);
      throw err;
    })
  );
};
