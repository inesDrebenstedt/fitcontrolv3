// src/app/app-routing.module.ts
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './features/home/component/home.component'; 
import { WorkoutListComponent } from './features/workout/pages/workout-list/workout-list.component';
import { WorkoutCreateComponent } from './features/workout/pages/workout-create/workout-create.component';
import { WorkoutDetailComponent } from './features/workout/pages/workout-detail/workout-detail.component';
import { ExerciseListComponent } from './features/exercise/pages/list/exercise-list.component';
import { ExerciseDetailsComponent } from './features/exercise/pages/details/exercise-details.component';
import { SelectExerciseComponent } from './features/exercise/pages/select/select-exercise.component';
import { CreateExerciseComponent } from './features/exercise/pages/create-new/create-exercise/create-exercise.component';
import { WorkoutexerciseDetailComponent } from './features/workoutexercise/pages/workoutexercise-detail/workoutexercise-detail.component';
import { LoginComponent } from './features/login/login/login.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'workout/all', component: WorkoutListComponent },
  { path: 'workout/singleworkout', component: WorkoutDetailComponent },
  { path: 'workout/create', component: WorkoutCreateComponent },
  { path: 'workout/workoutexercise', component: WorkoutexerciseDetailComponent },
  { path: 'exercise/all', component: ExerciseListComponent },
  { path: 'exercise/singleexercise', component: ExerciseDetailsComponent },
  { path: 'exercise/select', component: SelectExerciseComponent },
  { path: 'exercise/create', component: CreateExerciseComponent },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
