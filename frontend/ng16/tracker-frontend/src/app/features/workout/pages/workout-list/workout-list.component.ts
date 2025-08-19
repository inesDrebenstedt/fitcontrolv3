import { Component, OnInit } from '@angular/core';
import { WorkoutService } from '../../../../shared/services/workout.service';
import { ActivatedRoute } from '@angular/router';
import { Workout } from '../../../../core/model/workout';
import { CommonModule } from '@angular/common';
import { Router,  } from '@angular/router';
import { ActionwidgetComponent } from "@old_shared/components/actionwidget/actionwidget.component";
import { MatGridList, MatGridTile } from "@angular/material/grid-list";

import { MatIconModule } from "@angular/material/icon";


@Component({
  standalone: true,
  selector: 'app-workout-list',
  templateUrl: './workout-list.component.html',
  styleUrls: ['./workout-list.component.scss'],
  imports: [ActionwidgetComponent, MatGridList, MatGridTile, MatIconModule, CommonModule]
})
export class WorkoutListComponent implements OnInit{

  constructor(
    private workoutService: WorkoutService, 
    private route: ActivatedRoute, 
    private router: Router
  ) { }

  navbarTitle: string = 'List of Workouts';
  testDate = new Date();//TODO remove
  workouts: Workout[] | undefined;
  comingFromListView: boolean | undefined;

  ngOnInit(): void {
    this.workoutService.getWorkouts().subscribe(data => {
      this.workouts = data;
      console.log('workouts: ' + this.workouts.length)
    });
    
  }


  onTileClick(workout: Workout): void {
    this.workoutService.setWorkout(workout);
    this.router.navigate(['workout/singleworkout'], 
      { 
        queryParams: { workoutId: workout.id },
        state: { comingFromListView: true } 
      });
}


  onCreateWorkoutClick() {
    this.router.navigate(['/workout/create']);
  }



}
