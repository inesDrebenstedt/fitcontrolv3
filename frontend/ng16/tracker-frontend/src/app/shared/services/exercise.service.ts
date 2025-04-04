import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from './../../../../src/environments/environment.local';
import { Exercise } from 'src/app/core/model/exercise';
import { MuscleGroup } from 'src/app/core/enums/muscle-group';

@Injectable({
  providedIn: 'root'
})
export class ExerciseService {


  private apiUrl = `${environment.apiBaseUrl}/exercise`;
  exercise: Exercise | undefined;


  constructor(private http: HttpClient) { }

  getExercises(): Observable<Exercise[]> {
    return this.http.get<Exercise[]>(`${this.apiUrl}/all`);
  }

  getExercise(id: string): Observable<Exercise> {
    return this.http.get<Exercise>(`${this.apiUrl}/singleexercise?exerciseId=${id}`);
  }

  updateExercise(newExercise: Exercise): Observable<Exercise> {
    return this.http.put<Exercise>(`${this.apiUrl}/update`, newExercise);
  }

  deleteExercise(exerciseId: number): Observable<Exercise> {
    return this.http.delete<Exercise>(`${this.apiUrl}/delete`,
      {
        params: {
          exerciseId: exerciseId,
        }
      }
    );
  }

  saveExercise(newExercise: Exercise) {
    console.log('........s ending new exercise: ' + JSON.stringify(newExercise))
    return this.http.post<Exercise>(`${this.apiUrl}/create`, newExercise);
  }

}
