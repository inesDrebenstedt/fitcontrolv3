import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from './../../../../src/environments/environment.local';
import { Workout } from 'src/app/core/model/workout';
import { WorkoutExercise } from 'src/app/core/model/workout-exercise';
import { ExerciseSet } from 'src/app/core/model/exercise-set';

@Injectable({
  providedIn: 'root'
})
export class WorkoutService {

  private apiUrl = `${environment.apiBaseUrl}/workout`;
  private selectedWorkout?: Workout; 

  constructor(private http: HttpClient) { }

  setWorkout(workout: Workout) {
    this.selectedWorkout = workout;
  }

  getWorkoutFromMemory(): Workout | undefined {
    return this.selectedWorkout;
  }

  getWorkouts(): Observable<Workout[]> {
    console.log('............ WorkoutService getWorkouts ' )
    return this.http.get<Workout[]>(`${this.apiUrl}/all`);
  }

  getWorkout(id: number): Observable<Workout> {
    console.log('............ WorkoutService getWorkout ' )
    return this.http.get<Workout>(`${this.apiUrl}/singleworkout?workoutId=${id}`);
  }

  createWorkout(newWorkout: Workout): Observable<Workout> {
    console.log('............ WorkoutService createWorkout: ' + JSON.stringify(newWorkout) )
    return this.http.post<Workout>(`${this.apiUrl}/create`, newWorkout)
  }

  updateWorkout(workout: Workout) {
    console.log('............ WorkoutService updateWorkout: ' )
    return this.http.put<Workout>(`${this.apiUrl}/update`, workout);
  }

  addWorkoutExercise(workoutId: number, exerciseId: number): Observable<Workout>{ 
    console.log('............. addWorkoutExercise called')
    return this.http
    .put<Workout>(`${this.apiUrl}/addWorkoutExercise`, null, {
      params: {
        workoutId: workoutId,
        exerciseId: exerciseId
      }
    });
  }

  /*
  addSet(workoutexercise: WorkoutExercise): Observable<Workout> {
    return this.http.put<Workout>(`${this.apiUrl}/addWorkoutExerciseSet`, null, {
      params: {
        workoutExerciseId: workoutexercise.id!
      }
    });
  }
  */

  addSetTo(workoutExerciseId: number): Observable<Workout> {
    return this.http
    .put<Workout>(`${this.apiUrl}/addWorkoutExerciseSet/${workoutExerciseId}`, null, {
      params: {
        workoutExerciseId: workoutExerciseId
      }
    });
  }

  saveSet( set: ExerciseSet, workoutExerciseId: number): Observable<ExerciseSet> {
    console.log('??????????????????? ' + set.reps.length)
    return this.http.post<ExerciseSet>(`${this.apiUrl}/saveExerciseSet`, set,  {
      params: {
        workoutExerciseId: workoutExerciseId
      }
    });
  }

  deleteSet(setId: number, workoutExerciseId: number) {
    return this.http.delete<ExerciseSet>(`${this.apiUrl}/deleteExerciseSet`, 
        {
          params: {
            setId: setId,
            workoutExerciseId: workoutExerciseId
          }
        }
    );
  }

  deleteWorkoutExercise(workout: Workout, workoutExerciseId: number) {
    console.log('............ WorkoutService deleteWorkoutExercise: ' + workout.id + ' -> ' + workoutExerciseId )
    const params = new HttpParams().set('workoutExerciseId', workoutExerciseId.toString());
    const options = {
      headers: new HttpHeaders({
        'Content-Type': 'application/json'
      }),
      body: workout,
      params: params
    };

    return this.http.delete<Workout>(`${this.apiUrl}/deleteWorkoutExercise`, options 

  );
  }

  saveWorkout(workout: Workout) {
    console.log('............ WorkoutService saveWorkout: ' + workout.workoutexercises.length )
    return this.http.post<Workout>(`${this.apiUrl}/update`, workout);
  }

  deleteWorkout(workoutId: number) { 
    return this.http.delete<Workout>(`${this.apiUrl}/delete?workoutId=${workoutId}`);
  }

  /*
  getWorkoutId(id: string): void {
    this.getWorkout(id).subscribe(workout => {
      this.workout = workout;
    });
  }
    */

}
