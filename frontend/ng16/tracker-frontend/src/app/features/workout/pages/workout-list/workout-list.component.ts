import { Component, OnInit } from '@angular/core';
import { WorkoutService } from '../../../../shared/services/workout.service';
import { ActivatedRoute } from '@angular/router';
import { Workout } from '../../../../core/model/workout';
import { CommonModule } from '@angular/common';
import { Router,  } from '@angular/router';
import { ActionwidgetComponent } from "@old_shared/components/actionwidget/actionwidget.component";
import { MatGridList, MatGridTile } from "@angular/material/grid-list";

import { MatIconModule } from "@angular/material/icon";
import { AppUserService } from '@old_shared/services/appuser.service';
import { AppUser } from 'src/app/core/model/appuser';


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
    private router: Router,
    private appUserService: AppUserService,
  ) { }

  navbarTitle: string = 'List of Workouts';
  testDate = new Date();//TODO remove
  workouts: Workout[] | undefined;
  comingFromListView: boolean | undefined;
  currentAppUser: AppUser | undefined;

  ngOnInit(): void {
    this.appUserService.getCurrentAppUserInfo().subscribe(appUser => {
      console.log('-----user as JSON: ' + JSON.stringify(appUser));
      this.currentAppUser = appUser

      if(this.currentAppUser){
        console.log('-----user not undefined: ');

      this.workoutService.getWorkoutsOfCurrentUser(this.currentAppUser.userName).subscribe(data => {
        this.workouts = data;
        console.log('workouts of user : ' + this.workouts.length)
      });
    } else {
      console.log('-----user IS undefined: ');
      this.workoutService.getWorkouts().subscribe(data => {
        this.workouts = data;
        //console.log('-----workouts as JSON: ' + JSON.stringify(data));
        console.log('no user found. workouts: ' + this.workouts.length)
      });
    }

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
