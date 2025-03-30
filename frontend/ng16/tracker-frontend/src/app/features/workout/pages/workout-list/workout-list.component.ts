import { Component, OnInit } from '@angular/core';
import { WorkoutService } from 'src/app/shared/services/workout.service';
import { ActivatedRoute } from '@angular/router';
import { Workout } from 'src/app/core/model/workout';
import { format, parseISO } from 'date-fns';
import { Router,  } from '@angular/router';


@Component({
  selector: 'app-workout-list',
  templateUrl: './workout-list.component.html',
  styleUrls: ['./workout-list.component.scss']
})
export class WorkoutListComponent implements OnInit{

  constructor(
    private workoutService: WorkoutService, 
    private route: ActivatedRoute, 
    private router: Router
  ) { }

  navbarTitle: string = 'List of Workouts TODO';
  testDate = new Date();//TODO remove
  workouts: Workout[] | undefined;

  ngOnInit(): void {
    this.workoutService.getWorkouts().subscribe(data => {
      this.workouts = data;
    });
    
  }


  onTileClick(workout: Workout): void {
    this.workoutService.setWorkout(workout);
    this.router.navigate(['workout/singleworkout'], { queryParams: { workoutId: workout.id } });
}


  onCreateWorkoutClick() {
    this.router.navigate(['/workout/create']);
  }



}
