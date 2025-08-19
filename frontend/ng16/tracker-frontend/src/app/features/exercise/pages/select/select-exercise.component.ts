import { Component, OnInit } from '@angular/core';
import { ExerciseService } from '../../../../shared/services/exercise.service';
import { ActivatedRoute } from '@angular/router';
import { Exercise } from '../../../../../app/core/model/exercise';   
import { Router, } from '@angular/router';
import { ActionwidgetComponent } from "@old_shared/components/actionwidget/actionwidget.component";
import { MatGridList, MatGridTile } from "@angular/material/grid-list";

import { MatIconModule } from "@angular/material/icon";
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-select-exercise',
  templateUrl: './select-exercise.component.html',
  styleUrls: ['./select-exercise.component.scss'],
  imports: [ActionwidgetComponent, MatGridList, MatGridTile, MatIconModule, CommonModule]
})
export class SelectExerciseComponent {

  workoutId!: number;  // To store the workoutId passed from WorkoutDetailComponent

  constructor(
    private exerciseService: ExerciseService,
    private route: ActivatedRoute,
    private router: Router
  ) {
    // Get the workoutId from the router state
    const navigation = this.router.getCurrentNavigation();
    if (navigation?.extras.state) {
      this.workoutId = navigation.extras.state['workoutId'];
    }
  }

  navbarTitle: string = 'Select Exercises TODO';
  exercises: Exercise[] | undefined;

  ngOnInit(): void {
    this.exerciseService.getExercises().subscribe(data => {
      this.exercises = data;
    });
  }

  addExerciseToWorkout(exercise: Exercise): void {
    console.log('addExerciseToWorkout clicked. workoutid = ' + this.workoutId)
    console.log('addExerciseToWorkout clicked. exerciseId = ' + exercise.id)

    this.router.navigate(['workout/singleworkout'],
      { queryParams: { workoutId: this.workoutId }, 
      state: { selectedExerciseId: exercise.id, comingFromExerciseSelectionView: true } }
    );
  }

}
