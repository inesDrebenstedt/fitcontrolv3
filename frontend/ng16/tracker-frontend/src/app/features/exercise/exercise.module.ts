import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ExerciseDetailsComponent } from './pages/details/exercise-details.component';
import { ExerciseListComponent } from './pages/list/exercise-list.component';
import { FormsModule } from '@angular/forms';
import { ReactiveFormsModule } from '@angular/forms'; 
import { MatGridListModule } from '@angular/material/grid-list';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { SharedModule } from 'src/app/shared/shared.module';
import { SelectExerciseComponent } from './pages/select/select-exercise.component';
import { CreateExerciseComponent } from './pages/create-new/create-exercise/create-exercise.component';


@NgModule({
  declarations: [
    ExerciseDetailsComponent, 
    ExerciseListComponent, 
    SelectExerciseComponent, 
    CreateExerciseComponent,

  ],
  imports: [
    CommonModule,
    SharedModule,
    MatGridListModule,
    MatButtonModule,
    MatIconModule,
    MatExpansionModule,
    MatToolbarModule,
    MatInputModule,
    MatFormFieldModule,
    ReactiveFormsModule,
    FormsModule,

  ],
  exports: [
    ExerciseDetailsComponent, 
    ExerciseListComponent
  ]
})
export class ExerciseModule { }
