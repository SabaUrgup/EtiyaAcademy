import { ApplicationConfig, provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';

import { routes } from './app.routes';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { provideNetlifyLoader } from '@angular/common';
import { authInterceptor } from './shared/interceptors/auth.interceptor';

// Global konfigürasyon yapısı (kod için)
export const appConfig: ApplicationConfig = {
  providers: [
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideHttpClient(withInterceptors([authInterceptor])), // artık tüm uygulama http client kullanabilir
  ],
};

// httpclient,
