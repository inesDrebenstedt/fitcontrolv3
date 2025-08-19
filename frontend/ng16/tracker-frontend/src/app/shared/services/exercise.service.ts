import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
//import { environment } from '../../../environments/environment.prod';
import { environment } from '../../../environments/environment.local';
import { Exercise } from '../../core/model/exercise';
import { MuscleGroup } from '../../core/enums/muscle-group';

@Injectable({
  providedIn: 'root'
})
export class ExerciseService {


  // private apiUrl = `${environment.apiBaseUrl}/exercise`;
  //private apiUrl = `/exercise`; // or ingress
  private apiUrl = `${environment.apiUrl}/exercise`;
  exercise: Exercise | undefined;


  constructor(private http: HttpClient) { }

  getExercises(): Observable<Exercise[]> {
        console.log('............  getExercises ' + this.apiUrl )
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
