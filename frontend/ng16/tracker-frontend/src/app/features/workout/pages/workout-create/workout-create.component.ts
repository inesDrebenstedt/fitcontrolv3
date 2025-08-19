import { Component } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { WorkoutClass } from '../../../../../app/core/class/workout.class';
import { WorkoutExerciseClass } from '../../../../../app/core/class/workoutExercise.class';
import { Exercise } from '../../../../core/model/exercise';
import { Workout } from '../../../../core/model/workout';
import { WorkoutExercise } from '../../../../core/model/workout-exercise';
import { ExerciseService } from '../../../../shared/services/exercise.service';
import { WorkoutService } from '../../../../shared/services/workout.service';
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { MatFormFieldModule, MatLabel } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';

@Component({
  standalone: true,
  selector: 'app-workout-create',
  templateUrl: './workout-create.component.html',
  styleUrls: ['./workout-create.component.scss'],
  imports: [ReactiveFormsModule, MatFormFieldModule, CommonModule, MatLabel, MatInputModule]
})
export class WorkoutCreateComponent {

  constructor(
    private fb: FormBuilder,
    private exerciseService: ExerciseService,
    private workoutService: WorkoutService,
    private route: ActivatedRoute,
    private router: Router
  ) { }

  newWorkout: Workout | undefined;
  createWorkoutForm!: FormGroup; // = this.fb.group({});
  formControl: FormControl = new FormControl('');
  description: string = '';
  workoutExercises: WorkoutExercise[] = [];
  exercises: Exercise[] | undefined;
  comingFromCreationView: boolean | undefined;

  // Model for the selected value
  selectedExercise: Exercise | undefined;

  ngOnInit() {
    this.createWorkoutForm = this.fb.group({
      titleField: [''],
      descriptionField: [''],
      workoutExercisesListInFg: [''],
      dateInFg: [''],
    });

    this.exerciseService.getExercises().subscribe(data =>
    {this.exercises = data}
    );
console.log('found exercises: ' + this.exercises?.length)
  }

  onSubmit() {
    const now = new Date();
    let createdWorkout: Workout | undefined;
    let newWorkoutTitle = this.createWorkoutForm.get('titleField')?.value;
    this.newWorkout = new WorkoutClass(0, this.workoutExercises, newWorkoutTitle, now, 0, false);
    this.workoutService.createWorkout(this.newWorkout).subscribe(data => {
      createdWorkout = data;
      console.log('---------- createdWorkout: ' + JSON.stringify(createdWorkout));
    
              //TODO : show detail page of this new workout
      this.router.navigate(['/workout/createdworkout'], { 
        queryParams: { title: createdWorkout!.title, creationTime: createdWorkout!.date },
         state: { comingFromWorkoutCreationView: true } 
        });
    });

  }

  addWorkoutExercise() {
    this.selectedExercise = this.createWorkoutForm.get('workoutExercisesListInFg')?.value;
    let newWorkoutExercise = new WorkoutExerciseClass(this.selectedExercise!.title, '', this.newWorkout!, [], [], [], this.selectedExercise!);
    this.workoutExercises.push(newWorkoutExercise)
    console.log('WorkoutExercises? --> ' + JSON.stringify(this.workoutExercises))
    this.createWorkoutForm.get('workoutExercisesListInFg')?.setValue('');
  }

}
