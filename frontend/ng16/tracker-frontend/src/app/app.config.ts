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


/*
import { ApplicationConfig, APP_INITIALIZER, provideZoneChangeDetection } from '@angular/core';
import { provideRouter } from '@angular/router';
import { provideHttpClient, withInterceptors } from '@angular/common/http';

import { OAuthService, JwksValidationHandler, OAuthStorage, AuthConfig } from 'angular-oauth2-oidc';
import { routes } from './app.routes'; // Your routing file
//import { authInterceptor } from './shared/services/auth.interceptor'; // Create this next

// Keycloak Configuration
export const authConfig: AuthConfig = {
  issuer: 'http://localhost:8080/realms/MyProjectRealm', // Your Keycloak realm URL
  redirectUri: window.location.origin, // Your Angular app's root URL
  clientId: 'angular-client', // Angular client ID from Keycloak
  responseType: 'code', // Use 'code' for PKCE
  scope: 'openid profile email offline_access', // Request standard scopes
  showDebugInformation: true, // For development, set to false in production
  disableAtHashCheck: true, // IMPORTANT: For local development, remove in prod
  // Other optional settings:
  // skipIssuerCheck: true, // If issuer URL changes from discovery document
  // logoutUrl: 'http://localhost:8080/realms/MyProjectRealm/protocol/openid-connect/logout?redirect_uri=' + encodeURIComponent(window.location.origin),
};

// Initialization function for APP_INITIALIZER
export function initializeOAuth(oauthService: OAuthService) {
  return async () => {
    oauthService.configure(authConfig);
    oauthService.tokenValidationHandler = new JwksValidationHandler(); // Or create custom
    oauthService.setupAutomaticSilentRefresh(); // Keep tokens fresh

    // Tries to login automatically if a code is present in the URL
    // or if a refresh token is available
    await oauthService.loadDiscoveryDocumentAndTryLogin();

    // Optional: Route to a default page after login if not already
    // if (oauthService.has='...'.
  };
}

export const appConfig: ApplicationConfig = {
  providers: [
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideHttpClient(withInterceptors([authInterceptor])), // Provide HttpClient and register interceptor
    { provide: OAuthStorage, useValue: localStorage }, // Use localStorage for token persistence
    OAuthService, // Provide the OAuthService
    {
      provide: APP_INITIALIZER, // Initialize OAuthService before the app loads
      useFactory: initializeOAuth,
      deps: [OAuthService],
      multi: true,
    },
  ]
};

*/