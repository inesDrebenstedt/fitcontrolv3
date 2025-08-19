import { Component, OnInit } from '@angular/core';
import { Router, RouterOutlet } from "@angular/router";
import { NavbarComponent } from "@shared/components/navbar/navbar.component"; // Ensure paths are correct
import { RouterModule } from '@angular/router';
import { HttpClient, HttpErrorResponse } from '@angular/common/http'; // Import HttpErrorResponse
import { catchError, tap } from 'rxjs/operators'; // Import catchError and tap
import { of } from 'rxjs'; // Import of for returning an observable in catchError

@Component({
  standalone: true,
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
  imports: [RouterOutlet, NavbarComponent, RouterModule],
})
export class AppComponent implements OnInit {
  title = 'tracker-frontend';
  userInfo: string = 'Loading user info...';

  constructor(private http: HttpClient, private router: Router) {}

  ngOnInit(): void {
    // On initial load, always try to fetch user info.
    // If it fails (e.g., due to 401/403/network error indicating unauthenticated state),
    // then we'll trigger the full browser redirect.
    this.fetchUserInfo();
  }

  fetchUserInfo() {
    // This is the endpoint that Spring Boot protects.
    const userInfoApiUrl = '/fitcontrol/tracker/api/user-info';
    // This is the endpoint that initiates the OAuth2 flow on Spring Boot.
    const springBootAuthUrl = 'http://localhost:8083/fitcontrol/tracker/oauth2/authorization/keycloak';

    this.http.get(userInfoApiUrl, { withCredentials: true }).pipe(
      tap((data: any) => {
        // If successful, display the user info
        this.userInfo = JSON.stringify(data, null, 2); // Pretty print JSON
        console.log('Successfully fetched user info:', data);
      }),
      catchError((error: HttpErrorResponse) => {
        console.error('Error fetching user info:', error);

        if (error.status === 401 || error.status === 403 || error.status === 0) {
          console.log('User is not authenticated. Redirecting full browser to Spring Boot for Keycloak login...');

          window.location.href = springBootAuthUrl;
        } else {
          this.userInfo = `Error fetching user info: ${error.message || 'Unknown error'}`;
        }
        return of(null); // Return an observable of null to complete the stream gracefully
      })
    ).subscribe(
      // The subscribe block now primarily logs success. Errors are handled in catchError.
      // If `data` is null, it means `catchError` was hit and `of(null)` was returned.
      (data) => {
        if (data === null) {
          console.log('Redirect initiated, subscription completed gracefully.');
        }
      },
      (error) => {
        // This error callback will only be hit if there's an error *after* catchError,
        // which should ideally not happen if `of(null)` is returned.
        console.error('Uncaught error in subscribe after catchError:', error);
      }
    );
  }
}