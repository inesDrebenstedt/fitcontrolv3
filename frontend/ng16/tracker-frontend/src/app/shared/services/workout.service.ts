import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
//import { environment } from './../../../../src/environments/environment.prod';
import { environment } from '../../../environments/environment.local'
import { Workout } from '../../core/model/workout';
import { WorkoutExercise } from '../../core/model/workout-exercise';
import { ExerciseSet } from '../../core/model/exercise-set';
import { AppUser } from 'src/app/core/model/appuser';

@Injectable({
  providedIn: 'root'
})
export class WorkoutService {

  //private apiUrl = `${environment.apiBaseUrl}/workout`;
  //private apiUrl = `/workout`; // for ingress
  private apiUrl = `${environment.apiUrl}/workout`;
  private selectedWorkout?: Workout; 

  constructor(private http: HttpClient) { }

  setWorkout(workout: Workout) {
    this.selectedWorkout = workout;
  }

  getWorkoutFromMemory(): Workout | undefined {
    return this.selectedWorkout;
  }

  getWorkoutsOfCurrentUser(userName: string): Observable<Workout[]> {
    console.log('............ WorkoutService getWorkouts of user: ' )
    return this.http.get<Workout[]>(`${this.apiUrl}/allof?userName=${userName}`);
  }

  getWorkouts(): Observable<Workout[]> {
    console.log('............ WorkoutService getWorkouts ' + this.apiUrl )
    return this.http.get<Workout[]>(`${this.apiUrl}/all`);
  }

  getWorkout(id: number): Observable<Workout> {
    console.log('............ WorkoutService getWorkout ' )
    return this.http.get<Workout>(`${this.apiUrl}/singleworkout?workoutId=${id}`);
  }

  getPrimaryMuscleGroupStats(){
    return this.http.get<Workout>(`${this.apiUrl}/primarymusclegroupstats`).subscribe(data => {
    console.log(data);
  });
  }

    findWorkoutByTitleAndCreationDate(title: string, creationTime: Date): Observable<Workout> {
    console.log('............ WorkoutService findWorkoutByTitleAndCreationDate '  + title + ', ' + creationTime)
    return this.http.get<Workout>(`${this.apiUrl}/createdworkout?title=${title}?creationTime=${creationTime}`);
  }

  createWorkout(newWorkout: Workout): Observable<Workout> {
    console.log('............ WorkoutService createWorkout: ' + JSON.stringify(newWorkout) )
    return this.http.post<Workout>(`${this.apiUrl}/create`, newWorkout)
  }

    patchWorkout(workout: Workout) {
    console.log('............ WorkoutService patch workout: ' )
    return this.http.patch<Workout>(`${this.apiUrl}/patch`, workout);
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
    console.log('workoutservice saveSet: ' + set.reps.length)
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

  saveWorkout(workout: Workout): Observable<Workout> {
    console.log('............ WorkoutService saveWorkout: ' + workout.workoutexercises.length )
    return this.http.put<Workout>(`${this.apiUrl}/update`, workout);
  }

  deleteWorkout(workoutId: number) { 
     console.log('............ WorkoutService deleteWorkout ' + this.apiUrl )
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
