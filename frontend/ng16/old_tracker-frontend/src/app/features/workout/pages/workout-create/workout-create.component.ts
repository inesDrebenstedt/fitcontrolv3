import { Component } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { WorkoutClass } from 'src/app/core/class/workout.class';
import { WorkoutExerciseClass } from 'src/app/core/class/workoutExercise.class';
import { Exercise } from 'src/app/core/model/exercise';
import { Workout } from 'src/app/core/model/workout';
import { WorkoutExercise } from 'src/app/core/model/workout-exercise';
import { ExerciseService } from 'src/app/shared/services/exercise.service';
import { WorkoutService } from 'src/app/shared/services/workout.service';


@Component({
  selector: 'app-workout-create',
  templateUrl: './workout-create.component.html',
  styleUrls: ['./workout-create.component.scss']
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
  createWorkoutForm: FormGroup = this.fb.group({});
  formControl: FormControl = new FormControl('');
  description: string = '';
  workoutExercises: WorkoutExercise[] = [];
  exercises: Exercise[] | undefined;

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

  }

  onSubmit() {
    const now = new Date();
    let createdWorkout: Workout | undefined;//TODO
    let newWorkoutTitle = this.createWorkoutForm.get('titleField')?.value;
    this.newWorkout = new WorkoutClass(0, this.workoutExercises, newWorkoutTitle, now, 0, false);
    this.workoutService.createWorkout(this.newWorkout).subscribe(data => {
      createdWorkout = data;

      console.log('---------- createdWorkout: ' + JSON.stringify(createdWorkout));
      //TODO : show detail page of this new workout
      this.router.navigate(['/workout/singleworkout'], { queryParams: { workoutId: createdWorkout!.id } , state: { comingFromWorkoutCreationView: true } });

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
