// src/app/services/auth.service.ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { tap, catchError } from 'rxjs/operators';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
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
}