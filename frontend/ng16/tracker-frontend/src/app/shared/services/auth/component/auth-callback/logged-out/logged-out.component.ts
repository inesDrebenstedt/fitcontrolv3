
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-logged-out',
  standalone: true,
  imports: [CommonModule, RouterModule],
  template: `
    <h2>You have been logged out.</h2>
    <p>Thank you for using our service.</p>
    <button routerLink="/">Go to Home</button>
  `,
  styles: [`
    :host {
      display: block;
      padding: 20px;
      font-family: sans-serif;
    }
    button {
      margin-top: 20px;
      padding: 8px 15px;
      cursor: pointer;
    }
  `]
})
export class LoggedOutComponent { }