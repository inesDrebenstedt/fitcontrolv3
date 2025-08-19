import { bootstrapApplication } from '@angular/platform-browser';

/*
import { App } from './app/app';
import { appConfig } from './app/app.config';

bootstrapApplication(App, appConfig).catch((err) => console.error(err));
*/

import { AppComponent } from './app/app.component';
import { provideRouter } from '@angular/router';
//import { appConfig } from './app/app.config';
import { routes } from './app/app.routes';
import { provideHttpClient } from '@angular/common/http';

bootstrapApplication(AppComponent, {
      providers: [
    provideRouter(routes),
    provideHttpClient(),
    // other providers (if any)
  ]
}).catch((err) => console.error(err));
