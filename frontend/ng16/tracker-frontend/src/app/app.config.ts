import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient, withInterceptors , withInterceptorsFromDi, HTTP_INTERCEPTORS } from '@angular/common/http';
import { routes } from './app.routes';
import { authInterceptorFn } from './shared/services/auth/auth.interceptor';


export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
        provideHttpClient(
      withInterceptors([authInterceptorFn]) // 👈 register the interceptor function here
    ),
    //provideHttpClient(withInterceptorsFromDi()), // Enable DI for interceptors
    //{ provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true } // Register AuthInterceptor
  ]
};


