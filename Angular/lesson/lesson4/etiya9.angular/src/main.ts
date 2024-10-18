import { bootstrapApplication } from '@angular/platform-browser';
import { appConfig } from './app/app.config';
import { AppComponent } from './app/app.component';

// entrypoint, angular yapısını bir component üzerinden initiliaze eden ilk çalışan dosya.
bootstrapApplication(AppComponent, appConfig).catch((err) =>
  console.error(err)
);
