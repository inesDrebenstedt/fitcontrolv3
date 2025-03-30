import { NgModule } from '@angular/core';
import { MatButtonModule, MatIconButton } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatCardModule } from '@angular/material/card';
import { MatToolbarModule } from '@angular/material/toolbar';
import { CommonModule } from '@angular/common';
import { MatIconModule } from '@angular/material/icon'; 
// Import other Angular Material components as needed

@NgModule({
  imports: [
    CommonModule,
    MatButtonModule, 
    MatIconModule,
  ],
  exports: [
    MatButtonModule,
    MatInputModule,
    MatCardModule,
    MatToolbarModule,
    MatIconModule,
    // Export other Angular Material components here
  ]
})
export class MaterialModule { }
