import { Component, inject, OnInit, Output } from '@angular/core';
import { Router, RouterOutlet } from "@angular/router";
import { NavbarComponent } from "@shared/components/navbar/navbar.component"; // Ensure paths are correct
import { RouterModule } from '@angular/router';
import { HttpClient, HttpErrorResponse } from '@angular/common/http'; // Import HttpErrorResponse
import { catchError, tap } from 'rxjs/operators'; // Import catchError and tap
import { of } from 'rxjs'; // Import of for returning an observable in catchError
import { OAuthLogger, OAuthService, UrlHelperService } from 'angular-oauth2-oidc';
import { CommonModule } from '@angular/common';

@Component({
  standalone: true,
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
  imports: [RouterOutlet, NavbarComponent, RouterModule],
  providers: [OAuthService, UrlHelperService]
})
export class AppComponent implements OnInit {
  title = 'tracker-frontend';
  userInfo: string = 'Loading user info...';
  @Output('userDisplayName')
  userDisplayName: string = '';
  publicApiResponse: string = 'Not called';
  protectedApiResponse: string = 'Not called';

  constructor(private oauthService: OAuthService, private http: HttpClient) {}

  ngOnInit(): void {
    //this.updateUserDisplay();
    this.oauthService.events.subscribe(e => {
      if (e.type === 'token_received' || e.type === 'token_refreshed' || e.type === 'user_profile_loaded') {
        this.updateUserDisplay();
      }
    });
    this.fetchUserInfo();
  }

  ngAfterViewInit(): void {
    console.log('--------this.userDisplayName------ ' + this.userDisplayName)
    //Called after ngAfterContentInit when the component's view has been initialized. Applies to components only.
    //Add 'implements AfterViewInit' to the class.
    
  }

  updateUserDisplay() {
    if (this.oauthService.hasValidAccessToken()) {
      const claims = this.oauthService.getIdentityClaims();
      this.userDisplayName = claims ? claims['preferred_username'] || claims['name'] : 'User';
    } else {
      this.userDisplayName = '';
    }
  }

  isLoggedIn(): boolean {
    return this.oauthService.hasValidAccessToken();
  }

  login(): void {
    this.oauthService.initCodeFlow();
  }

  logout(): void {
    this.oauthService.logOut();
  }

  callPublicApi(): void {
    this.http.get('http://localhost:8081/api/public', { responseType: 'text' }).subscribe({
      next: response => this.publicApiResponse = response,
      error: err => this.publicApiResponse = `Error: ${err.message}`
    });
  }

  callProtectedApi(): void {
    this.http.get('http://localhost:8081/api/protected', { responseType: 'text' }).subscribe({
      next: response => this.protectedApiResponse = response,
      error: err => this.protectedApiResponse = `Error: ${err.message}`
    });
  }


  fetchUserInfo(){
    this.http.get<any>('http://localhost:8083/fitcontrol/tracker/user-info', { withCredentials: true }).subscribe({
  next: data => { 
    console.log('Successfully fetched user info:', data);
    this.userDisplayName = data.preferred_username;
    console.log('-------------------- NAME: ' + this.userDisplayName);
   },
  error: err => {
    if (err.status === 401 || err.status === 403) {
      console.log('-------------ERROR')
      // redirect the whole browser to backend's oauth2 login endpoint
      //window.location.href = 'http://localhost:8083/oauth2/authorization/keycloak';
    }
  }
});

  }

}