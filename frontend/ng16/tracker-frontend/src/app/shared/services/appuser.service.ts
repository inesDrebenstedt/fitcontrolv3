import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
//import { environment } from './../../../../src/environments/environment.prod';
import { environment } from '../../../environments/environment.local'
import { Workout } from '../../core/model/workout';
import { WorkoutExercise } from '../../core/model/workout-exercise';
import { ExerciseSet } from '../../core/model/exercise-set';
import { Router, ActivatedRoute } from '@angular/router';
import { AuthService } from './auth/auth.service';
import { ExerciseService } from './exercise.service';
import { WorkoutService } from './workout.service';
import { AppUser } from 'src/app/core/model/appuser';

@Injectable({
  providedIn: 'root'
})
export class AppUserService {

  private apiUrl = `${environment.apiUrl}/appuser`;
  private currentAppUser?: AppUser; 

      constructor(
    private router: Router,
    private route: ActivatedRoute,
    private workoutService: WorkoutService,
    private exerciseService: ExerciseService,
    private authService: AuthService,
    private http: HttpClient
  ) { }

    getCurrentAppUserInfo(): Observable<AppUser> {
    console.log('............ AppUserService getCurrentAppUserInfo ' )
    return this.http.get<AppUser>(`${this.apiUrl}/appuser-info`);
  }



}
