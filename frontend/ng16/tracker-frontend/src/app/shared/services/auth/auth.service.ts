// src/app/services/auth.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { tap, catchError } from 'rxjs/operators';
import { Router } from '@angular/router';
import { KeycloakTokenResponse } from 'src/app/core/interface/KeycloakTokenResponse';
import { DecodedToken } from 'src/app/core/interface/DecodedToken';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { jwtDecode } from 'jwt-decode'; // Ensure you have jwt-decode installed


@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private readonly KEYCLOAK_REDIRECT_URI = 'http://localhost:4200/auth-callback';
  private readonly KEYCLOAK_CLIENT_ID = 'fitcontrol-frontend-client'; // Must match Keycloak client ID
  private readonly KEYCLOAK_REALM = 'fitcontrol'; // Your Keycloak realm
  private readonly KEYCLOAK_BASE_URL = 'http://localhost:8081/realms'; // Your Keycloak instance URL
  private readonly TOKEN_ENDPOINT = '/api/auth/token'; // Spring Boot endpoint for token exchange
  private readonly LOGOUT_ENDPOINT = `${this.KEYCLOAK_BASE_URL}/${this.KEYCLOAK_REALM}/protocol/openid-connect/logout`;

  private isAuthenticatedSubject = new BehaviorSubject<boolean>(false);
  isAuthenticated$: Observable<boolean> = this.isAuthenticatedSubject.asObservable();

  private currentUserSubject = new BehaviorSubject<DecodedToken | null>(null);
  currentUser$: Observable<DecodedToken | null> = this.currentUserSubject.asObservable();

  constructor(private http: HttpClient, private router: Router) {
    this.checkAuthenticationStatus();
  }

  private checkAuthenticationStatus(): void {
    const accessToken = localStorage.getItem('access_token');
    if (accessToken) {
      try {
        const decodedToken: DecodedToken = jwtDecode(accessToken);
        if (decodedToken.exp * 1000 > Date.now()) {
          this.isAuthenticatedSubject.next(true);
          this.currentUserSubject.next(decodedToken);
        } else {
          this.logout(false); // Token expired
        }
      } catch (e) {
        console.error('Invalid access token:', e);
        this.logout(false);
      }
    }
  }

  login(): void {
    const codeVerifier = this.generateCodeVerifier();
    sessionStorage.setItem('code_verifier', codeVerifier);

    this.generateCodeChallenge(codeVerifier).then(codeChallenge => {
      const authUrl =
        `${this.KEYCLOAK_BASE_URL}/${this.KEYCLOAK_REALM}/protocol/openid-connect/auth?` +
        `client_id=${this.KEYCLOAK_CLIENT_ID}&` +
        `redirect_uri=${encodeURIComponent(this.KEYCLOAK_REDIRECT_URI)}&` +
        `response_type=code&` +
        `scope=openid profile email&` + // Request necessary scopes
        `code_challenge=${codeChallenge}&` +
        `code_challenge_method=S256`;
      window.location.href = authUrl;
    });
  }

  handleAuthCallback(code: string): Observable<any> {
    const codeVerifier = sessionStorage.getItem('code_verifier');
    if (!codeVerifier) {
      return new Observable(observer => observer.error('Code verifier not found in session storage.'));
    }

    const body = {
      code: code,
      code_verifier: codeVerifier,
      redirect_uri: this.KEYCLOAK_REDIRECT_URI
    };

    // Call Spring Boot backend to exchange code for tokens
    return this.http.post<KeycloakTokenResponse>(this.TOKEN_ENDPOINT, body).pipe(
      tap(tokens => {
        localStorage.setItem('access_token', tokens.access_token);
        localStorage.setItem('refresh_token', tokens.refresh_token);
        localStorage.setItem('id_token', tokens.id_token);
        sessionStorage.removeItem('code_verifier'); // Clear code verifier
        
        const decodedToken: DecodedToken = jwtDecode(tokens.access_token);
        this.isAuthenticatedSubject.next(true);
        this.currentUserSubject.next(decodedToken);
        this.router.navigate(['/']); // Navigate to a protected route or home
      })
    );
  }

  logout(redirectKeycloak: boolean = true): void {
    const refreshToken = localStorage.getItem('refresh_token');
    localStorage.removeItem('access_token');
    localStorage.removeItem('refresh_token');
    localStorage.removeItem('id_token');
    sessionStorage.removeItem('code_verifier');
    this.isAuthenticatedSubject.next(false);
    this.currentUserSubject.next(null);

    if (redirectKeycloak && refreshToken) {
      // Keycloak logout requires id_token_hint for identity confirmation
      // and redirect_uri for post-logout redirection.
      const idToken = localStorage.getItem('id_token');
      const logoutUrl =
        `${this.LOGOUT_ENDPOINT}?` +
        `client_id=${this.KEYCLOAK_CLIENT_ID}&` +
        `id_token_hint=${idToken}&` +
        `post_logout_redirect_uri=${encodeURIComponent('http://localhost:4200/logged-out')}`;
      window.location.href = logoutUrl;
    } else {
      this.router.navigate(['/logged-out']);
    }
  }

  getAccessToken(): string | null {
    return localStorage.getItem('access_token');
  }

  // --- PKCE Helper Functions ---
  private generateCodeVerifier(): string {
    const randomBytes = new Uint8Array(32);
    crypto.getRandomValues(randomBytes);
    return this.base64urlencode(randomBytes);
  }

  private async generateCodeChallenge(codeVerifier: string): Promise<string> {
    const plainText = new TextEncoder().encode(codeVerifier);
    const hashBuffer = await crypto.subtle.digest('SHA-256', plainText);
    return this.base64urlencode(new Uint8Array(hashBuffer));
  }

  private base64urlencode(buffer: Uint8Array): string {
    const base64 = btoa(String.fromCharCode(...buffer));
    return base64.replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
  }
  /*
  private logoutUrl = 'http://localhost:8083/fitcontrol/tracker/api/auth/logout'; // Your Spring Boot logout endpoint

  constructor(private http: HttpClient, private router: Router) {}

  logout(): void {
    this.http.post(this.logoutUrl, {}).pipe(
      tap(() => {
        // Backend will send a redirect. This part is mostly for local cleanup
        console.log('Logout request sent to backend.');
        localStorage.clear();
        sessionStorage.clear();
        // The browser will be redirected by the backend's response headers.
        // We ensure a local navigation too, in case of issues or for immediate UI update.
        this.router.navigate(['/login']);
      }),
      catchError(error => {
        console.error('Logout failed:', error);
        // Even if the backend call fails, try to clear local tokens and redirect
        localStorage.clear();
        sessionStorage.clear();
        this.router.navigate(['/login']);
        throw error; // Re-throw to propagate the error if needed
      })
    ).subscribe();
  }
    */
}