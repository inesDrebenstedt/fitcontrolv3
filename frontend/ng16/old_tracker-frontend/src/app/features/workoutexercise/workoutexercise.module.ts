import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WorkoutexerciseDetailComponent } from './pages/workoutexercise-detail/workoutexercise-detail.component';
import { MatGridListModule } from '@angular/material/grid-list';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatToolbarModule } from '@angular/material/toolbar';
import { SharedModule } from 'src/app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatCardModule } from '@angular/material/card'; 
import { DropdownModule } from 'primeng/dropdown';

@NgModule({
    declarations: [
      WorkoutexerciseDetailComponent,
    ],
    imports: [
      CommonModule,
      SharedModule,
      MatGridListModule,
      MatButtonModule,
      MatIconModule,
      MatExpansionModule,
      MatToolbarModule,
      MatFormFieldModule,
      MatInputModule,
      FormsModule,
      ReactiveFormsModule,
      MatCardModule,
      DropdownModule,
       
    ],
    exports: [
        WorkoutexerciseDetailComponent, 
    ]
  })
  export class WorkoutExerciseModule { }