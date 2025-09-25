import { Component, Input } from '@angular/core';
import { Router, NavigationEnd, ActivatedRoute } from '@angular/router';
import { WorkoutService } from '../../../shared/services/workout.service';
import { ExerciseService } from '../../../shared/services/exercise.service';
import { MatToolbar } from "@angular/material/toolbar";
import { MatIconModule } from "@angular/material/icon";
import { MatMenuModule } from '@angular/material/menu';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../services/auth/auth.service'
import { AppUserService } from '@old_shared/services/appuser.service';


@Component({
  standalone: true,
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss'],
  imports: [MatToolbar,
     MatIconModule,
      MatMenuModule,
    CommonModule ]
})
export class NavbarComponent {


  //@Input('navbarTitle') 
  navbarTitle: string = ' ';
  currentUrl: string = '';
  notInLoginMode = true;
  appUserName: string = '';

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private workoutService: WorkoutService,
    private exerciseService: ExerciseService,
    private authService: AuthService,
    private appUserService: AppUserService,
  ) { }

  ngOnInit() {
    this.router.events.subscribe(event => {
      if (event instanceof NavigationEnd) {
        this.currentUrl = event.urlAfterRedirects;
        this.navbarTitle = this.updateTitleBar();
      }
    });
      this.appUserService.getCurrentAppUserInfo().subscribe(appuser => {
        this.appUserName = appuser.userName
        //console.log('---------------> ' + JSON.stringify(appuser));
    });
  }



  getWorkoutTitle(): string {
    this.route.queryParams.subscribe(params => {
      const id = params['workoutId'];
      if (id) {
        this.workoutService.getWorkout(id).subscribe(workout => {
          this.navbarTitle = workout.title;
        });
      }
    });
    return this.navbarTitle;
  }

  getExerciseTitle(): string {
    this.route.queryParams.subscribe(params => {
      const id = params['exerciseId'];
      if (id) {
        this.exerciseService.getExercise(id).subscribe(exercise => {
          this.navbarTitle = exercise.title;
        });
      }
    });
    return this.navbarTitle;
  }


  updateTitleBar(): string {

    if (this.currentUrl.includes('/workout/singleworkout')) {
      return this.getWorkoutTitle();
    }

    if (this.currentUrl.includes('/exercise/singleexercise')) {
      return this.getExerciseTitle();
    }

    switch (this.currentUrl) {
      case '/':
        return 'Home Page of Workout Tracker';

        case '/login':
          this.notInLoginMode = false;
          return 'Log in to Workout Tracker';

      case '/workout/all':
        console.log('updateTitleBar CASE 1 ' + this.currentUrl);
        return 'List of Workouts';

      case '/workout/create':
        return 'Create new Workout';

      case '/exercise/all':
        return 'All Exercises';

      case '/exercise/create':
        return 'Create new Exercise';

      case '/exercise/select':
        return 'Select Exercise to add';
    }
              console.log('------navbarTitle updated---------> ' );
    return this.navbarTitle
  }

  onMenuClick() {
    console.log('menu button was clicked!');
  }

  goToHome() {
    this.router.navigate(['/']);
  }

  logout() {
    this.authService.logout();
    window.location.href = 'http://localhost:8083/fitcontrol/tracker/logout';
  }

}
