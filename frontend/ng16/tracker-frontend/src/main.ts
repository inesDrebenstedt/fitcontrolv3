import { bootstrapApplication } from '@angular/platform-browser';
import { AppComponent } from './app/app.component';
import { provideRouter } from '@angular/router';
import { routes } from './app/app.routes';
import { provideHttpClient, withInterceptors } from '@angular/common/http';
import { APP_INITIALIZER, importProvidersFrom } from '@angular/core';
import { KeycloakService } from 'keycloak-angular';
import { OAuthModule } from 'angular-oauth2-oidc';
//import { authInterceptor } from '@old_shared/services/auth/auth.interceptor';
import { authInterceptorFn } from './app/shared/services/auth/auth.interceptor';

// Keycloak init function called before app starts
function initializeKeycloak(keycloak: KeycloakService) {
  return () =>
    keycloak.init({
      config: {
        url: 'http://localhost:8081',
        realm: 'fitcontrol',
        clientId: 'fitcontrol-frontend-client',
      },
      initOptions: {
        onLoad: 'login-required',
        silentCheckSsoRedirectUri: window.location.origin + '/assets/silent-check-sso.html',
      },
      enableBearerInterceptor: false,
    });
}

bootstrapApplication(AppComponent, {

  providers: [
    importProvidersFrom(OAuthModule.forRoot()),
    provideRouter(routes),
    provideHttpClient(withInterceptors([authInterceptorFn])), //TODO ines: was included before pkce
    KeycloakService,
    {
      provide: APP_INITIALIZER,
      useFactory: initializeKeycloak,
      multi: true,
      deps: [KeycloakService],
    },
  ],
}).catch((err) => console.error(err));


/*
import { bootstrapApplication } from '@angular/platform-browser';
import { AppComponent } from './app/app.component';
import { provideRouter } from '@angular/router';
import { routes } from './app/app.routes';
import { provideHttpClient, withInterceptors, withInterceptorsFromDi } from '@angular/common/http';

// Import APP_INITIALIZER and KeycloakService
import { APP_INITIALIZER, importProvidersFrom } from '@angular/core';
import { KeycloakService } from 'keycloak-angular';
import { OAuthModule, OAuthService } from 'angular-oauth2-oidc';
import { authInterceptor } from '@old_shared/services/auth.interceptor';

// Define a function to initialize Keycloak
function initializeKeycloak(keycloak: KeycloakService) {
  return () =>
    keycloak.init({
      config: {
        url: 'http://localhost:8081',
        realm: 'fitcontrol',
        clientId: 'fitcontrol-frontend-client',
      },
      initOptions: {
        onLoad: 'login-required', // Ensures login before app loads
        silentCheckSsoRedirectUri: // Crucial for token refresh in background
          window.location.origin + '/assets/silent-check-sso.html',
      },
      enableBearerInterceptor: true, // Automatically adds Keycloak token to HTTP requests
    });
}

bootstrapApplication(AppComponent, {
  providers: [
    importProvidersFrom(OAuthModule.forRoot()),
    provideRouter(routes),
    // Ensure HttpClient is provided for interceptors
    provideHttpClient(
  withInterceptors([authInterceptor])
),
    // 1. Provide KeycloakService itself
    KeycloakService,

    // 2. Use APP_INITIALIZER to call keycloak.init() before the app bootstraps
    {
      provide: APP_INITIALIZER,
      useFactory: initializeKeycloak,
      multi: true, // Important: allows multiple APP_INITIALIZER providers
      deps: [KeycloakService], // Inject KeycloakService into the factory
    },
  ],
}).catch((err) => console.error(err));
*/