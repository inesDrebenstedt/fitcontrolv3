import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from '../../auth.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-auth-callback',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div *ngIf="loading">Processing authentication...</div>
    <div *ngIf="error" class="error">{{ error }}</div>
  `,
  styles: [`
    :host {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      font-family: sans-serif;
    }
    .error {
      color: red;
      font-weight: bold;
    }
  `]
})
export class AuthCallbackComponent implements OnInit {
  loading: boolean = true;
  error: string | null = null;

  constructor(
    private route: ActivatedRoute,
    private authService: AuthService,
    private router: Router
  ) {}

  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      const code = params['code'];
      const error = params['error'];

      if (code) {
        this.authService.handleAuthCallback(code).subscribe({
          next: () => {
            // Already navigated in auth service
            this.loading = false;
          },
          error: (err) => {
            console.error('Authentication callback error:', err);
            this.error = 'Login failed. Please try again.';
            this.loading = false;
            this.router.navigate(['/']); // Redirect to home or an error page
          }
        });
      } else if (error) {
        this.error = `Login failed: ${params['error_description'] || error}`;
        this.loading = false;
        this.router.navigate(['/']); // Redirect to home or an error page
      } else {
        this.error = 'No authorization code or error found in URL.';
        this.loading = false;
        this.router.navigate(['/']); // Redirect to home or an error page
      }
    });
  }
}