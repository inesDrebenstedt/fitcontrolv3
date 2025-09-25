
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Observable } from 'rxjs';
import { AuthService } from '@old_shared/services/auth/auth.service';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule],
  template: `
    <h2>Your Profile</h2>
    <div *ngIf="authService.currentUser$ | async as user">
      <p><strong>Name:</strong> {{ user.name }}</p>
      <p><strong>Username:</strong> {{ user.preferred_username }}</p>
      <p><strong>Email:</strong> {{ user.email }}</p>
      <p><strong>Roles:</strong> {{ user.realm_access?.roles?.join(', ') || 'N/A' }}</p>
      <p><strong>Issued At:</strong> {{ user.iat * 1000 | date:'medium' }}</p>
      <p><strong>Expires At:</strong> {{ user.exp * 1000 | date:'medium' }}</p>
    </div>
    <div *ngIf="!(authService.currentUser$ | async)">
      <p>No profile data available. Please log in.</p>
    </div>
    <button (click)="authService.logout()">Logout</button>
  `,
  styles: [`
    :host {
      display: block;
      padding: 20px;
      font-family: sans-serif;
    }
    p { margin-bottom: 5px; }
    button { margin-top: 20px; padding: 8px 15px; cursor: pointer; }
  `]
})
export class ProfileComponent implements OnInit {

  constructor(public authService: AuthService) { }

  ngOnInit(): void {
    // This component is protected by AuthGuard, so currentUser$ should be available
  }
}