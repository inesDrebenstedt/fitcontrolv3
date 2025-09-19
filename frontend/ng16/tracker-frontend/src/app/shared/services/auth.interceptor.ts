import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { KeycloakService } from 'keycloak-angular';
import { from, switchMap, catchError, of } from 'rxjs';

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  const keycloak = inject(KeycloakService);

  // Check if Keycloak is initialized and user is logged in
  if (!keycloak.isLoggedIn()) {
    console.log('Interceptor: Not logged in, skipping token addition.');
    return next(req); // Or redirect to login if necessary
  }

  // Use from() to convert the Promise to an Observable
  return from(keycloak.getToken()).pipe(
    switchMap(token => {
      if (token) {
        console.log('Interceptor triggered for URL:', req.url);
        const clonedReq = req.clone({
          setHeaders: {
            Authorization: `Bearer ${token}`
          }
        });
        //console.log('Interceptor added token:', token); // Log a partial token for security
        return next(clonedReq).pipe(
          catchError(error => {
            // Handle HTTP errors here if needed
            // e.g., if (error.status === 401) { keycloak.logout(); }
            throw error; // Re-throw the error for other error handlers to catch
          })
        );
      } else {
        console.log('Interceptor: No token available, passing request directly.');
        return next(req);
      }
    }),
    catchError(error => {
      // Handle errors during token retrieval (e.g., Keycloak not initialized)
      console.error('Error getting Keycloak token:', error);
      return next(req); // Proceed without token in case of error
    })
  );
};

/*
import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { OAuthService } from 'angular-oauth2-oidc';
import { KeycloakService } from 'keycloak-angular';

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  console.log('Interceptor triggered for URL:', req.url);
  const keycloakService  = inject(KeycloakService);
  const accessToken = keycloakService.getKeycloakInstance().token;

  // Only add token for your backend API calls
  if (accessToken && req.url.startsWith('http://localhost:8083/fitcontrol/tracker')) { // Adjust to your backend URL
    const authReq = req.clone({
      headers: req.headers.set('Authorization', `Bearer ${accessToken}`)
    });
    console.log('--------------------------intercept')
    console.log('Interceptor added token:', accessToken);
    return next(authReq);
  }
  return next(req);
};

*/