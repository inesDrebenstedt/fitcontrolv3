import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Workout } from '../../../../core/model/workout';
import { WorkoutExercise } from '../../../../core/model/workout-exercise';
import { WorkoutService } from '../../../../shared/services/workout.service';
import { MatCard, MatCardHeader, MatCardSubtitle, MatCardTitle } from "@angular/material/card";

import { MatAccordion, MatExpansionPanel, MatExpansionPanelHeader, MatExpansionPanelTitle } from "@angular/material/expansion";

import { CommonModule } from '@angular/common';

@Component({
  standalone: true,
  selector: 'app-workoutexercise-detail',
  templateUrl: './workoutexercise-detail.component.html',
  styleUrls: ['./workoutexercise-detail.component.scss'],
  imports: [MatCard,
        MatCardHeader,
        MatCardTitle,
        MatCardSubtitle,
        MatAccordion,
        MatExpansionPanel,
        MatExpansionPanelHeader,
        MatExpansionPanelTitle, CommonModule]
})
export class WorkoutexerciseDetailComponent implements OnInit {
  workoutId: number | undefined;
  workoutexerciseId: number | undefined;
  workout: Workout | undefined;
  workoutexercise: WorkoutExercise | undefined;

  constructor(
    private workoutService: WorkoutService,
    private route: ActivatedRoute,
    private router: Router,

  ) {

  }


  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      const id = params['workoutexerciseId'];
      this.workoutexerciseId = id;

      if (history.state 
        && history.state.workoutexerciseId
        && history.state.workoutId) {

        this.workoutexerciseId = history.state.workoutexerciseId;
        this.workoutId = history.state.workoutId;

        this.workoutService.getWorkout(this.workoutId!).subscribe(data => {
          this.workout = data;

          this.workout.workoutexercises.forEach(workoutExercise => {
            if (workoutExercise.id === this.workoutexerciseId){
              this.workoutexercise = workoutExercise;
            }
          })
        });
      }
    });
  }
}
