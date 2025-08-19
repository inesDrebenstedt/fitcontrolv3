import { Routes } from '@angular/router';
import { CreateExerciseComponent } from './features/exercise/pages/create-new/create-exercise/create-exercise.component';
import { ExerciseDetailsComponent } from './features/exercise/pages/details/exercise-details.component';
import { ExerciseListComponent } from './features/exercise/pages/list/exercise-list.component';
import { SelectExerciseComponent } from './features/exercise/pages/select/select-exercise.component';
import { HomeComponent } from './features/home/component/home.component';
import { WorkoutCreateComponent } from './features/workout/pages/workout-create/workout-create.component';
import { WorkoutDetailComponent } from './features/workout/pages/workout-detail/workout-detail.component';
import { WorkoutListComponent } from './features/workout/pages/workout-list/workout-list.component';
import { WorkoutexerciseDetailComponent } from './features/workoutexercise/pages/workoutexercise-detail/workoutexercise-detail.component';

export const routes: Routes = [
  { path: '', component: HomeComponent },
//  { path: 'login', component: LoginComponent },
  { path: 'workout/all', component: WorkoutListComponent },
  { path: 'workout/singleworkout', component: WorkoutDetailComponent },
  { path: 'workout/createdworkout', component: WorkoutDetailComponent },
  { path: 'workout/create', component: WorkoutCreateComponent },
  { path: 'workout/workoutexercise', component: WorkoutexerciseDetailComponent },
  { path: 'exercise/all', component: ExerciseListComponent },
  { path: 'exercise/singleexercise', component: ExerciseDetailsComponent },
  { path: 'exercise/select', component: SelectExerciseComponent },
  { path: 'exercise/create', component: CreateExerciseComponent },

];