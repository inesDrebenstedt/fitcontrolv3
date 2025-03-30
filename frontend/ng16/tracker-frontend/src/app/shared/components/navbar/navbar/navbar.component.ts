import { Component, Input } from '@angular/core';
import { Router, NavigationEnd, ActivatedRoute } from '@angular/router';
import { WorkoutService } from 'src/app/shared/services/workout.service';
import { ExerciseService } from 'src/app/shared/services/exercise.service';


@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.scss']
})
export class NavbarComponent {

  //@Input('navbarTitle') 
  navbarTitle: string = ' ';
  currentUrl: string = '';
  notInLoginMode = true;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private workoutService: WorkoutService,
    private exerciseService: ExerciseService,
  ) { }

  ngOnInit() {
    this.router.events.subscribe(event => {
      if (event instanceof NavigationEnd) {
        this.currentUrl = event.urlAfterRedirects;
        this.navbarTitle = this.updateTitleBar();
      }
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

    return this.navbarTitle
  }

  onMenuClick() {
    console.log('menu button was clicked!');
  }

  goToHome() {
    this.router.navigate(['/']);
  }

}
