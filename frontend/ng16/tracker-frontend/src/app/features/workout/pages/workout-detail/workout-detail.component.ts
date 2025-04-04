import { Component, OnInit, ViewChild } from '@angular/core';
import { WorkoutService } from 'src/app/shared/services/workout.service';
import { ActivatedRoute } from '@angular/router';
import { Workout } from 'src/app/core/model/workout';
import { Exercise } from 'src/app/core/model/exercise';
import { ExerciseSet } from 'src/app/core/model/exercise-set';
import { ExerciseService } from 'src/app/shared/services/exercise.service';
import { Router, } from '@angular/router';
import { WorkoutCreateComponent } from '../workout-create/workout-create.component';
import { WorkoutExercise } from 'src/app/core/model/workout-exercise';
import { WeightUnit } from "../../../../core/enums/weight-unit";
import { Rep } from 'src/app/core/model/rep';
import { Observable } from 'rxjs';
import { ExerciseSetClass } from 'src/app/core/class/exerciseset.class';
import { RepClass } from 'src/app/core/class/rep.class';
import { RepCategory } from 'src/app/core/enums/rep-category';

@Component({
  selector: 'app-workout-detail',
  templateUrl: './workout-detail.component.html',
  styleUrls: ['./workout-detail.component.scss']
})
export class WorkoutDetailComponent implements OnInit {

  navbarTitle: string = 'default workout navbar title';
  workout!: Workout;
  workoutId!: number;
  selectedExerciseId: number | undefined;
  comingFromExerciseSelectionView: boolean | undefined;
  isAddingSet: boolean = false;
  weightUnits: string[] = Object.values(WeightUnit);
  addSet: boolean | undefined;
  isTitleEditMode = false;

  // Convert unitValues to dropdown options
  weightUnitsDropdownOptions: { name: string; code: string }[] = this.weightUnits.map(value => ({
    name: value,
    code: value
  }));
  selectedOption: string | undefined; // This will hold the selected value from the dropdown

  constructor(
    private workoutService: WorkoutService,
    private route: ActivatedRoute,
    private router: Router,

  ) {
    /*
    this.route.params.subscribe(params => {
      const id = params['workoutId'];
      this.workoutId = id;
      console.log('**************0**************** ' + this.workoutId)
    });
    */
  }

  ngOnInit(): void {

    this.route.queryParams.subscribe(params => {
      const id = params['workoutId'];
      this.workoutId = id;

      this.workoutService.getWorkout(this.workoutId).subscribe(data => {
        this.workout = data;

        if (history.state && history.state.comingFromExerciseSelectionView) {
          this.comingFromExerciseSelectionView = history.state.comingFromExerciseSelectionView;

          // Get the selected exercise item from router state
          if (history.state && history.state.selectedExerciseId) {           
            this.selectedExerciseId = history.state.selectedExerciseId;
            this.addExerciseTo(this.workout, this.selectedExerciseId!);

            // Clear the selectedExerciseId in history.state using replaceState
            const updatedStateSelectedExerciseId = { ...history.state, selectedExerciseId: null };
            history.replaceState(updatedStateSelectedExerciseId, document.title, window.location.href);
            const updatedStatecomingFromExerciseSelectionView = { ...history.state, comingFromExerciseSelectionView: false };
            history.replaceState(updatedStatecomingFromExerciseSelectionView, document.title, window.location.href);

          }
        }

      });
    });
  }


  getWorkoutData(workoutId: number): Observable<Workout> {
    return this.workoutService.getWorkout(workoutId);
  }

  saveWorkout(workout: Workout) {
    this.workoutService.saveWorkout(workout);
  }

  addExerciseTo(workout: Workout, selectedExerciseId: number) {
     this.workoutService.addWorkoutExercise(workout.id!, selectedExerciseId!).subscribe(data => {
      this.workout = data;
     })
  }

  deleteExercise(workoutexerciseId: number, event: Event) {
    event.stopPropagation();
    this.workout.workoutexercises = this.workout.workoutexercises.filter(exercise => exercise.id !== workoutexerciseId);
    this.workoutService.deleteWorkoutExercise(this.workout, workoutexerciseId).subscribe();
  }

  addSetTo(workoutExercise: WorkoutExercise, addSet: boolean) {
    this.addSet = addSet;
    let newExerciseDefaultSet: ExerciseSet = new ExerciseSetClass(0, 0, WeightUnit.kg, "", [], 0, workoutExercise.id!, true);
    workoutExercise.sets.push(newExerciseDefaultSet);
  }

  editSet(set: ExerciseSet): void {
    set.isEditing = !set.isEditing;
  }

  deleteSet(set: ExerciseSet, workoutExerciseId: number) {
    // Call the service to delete the set
    this.workoutService.deleteSet(set.id!, workoutExerciseId).subscribe(() => {
      // Update the local array after deletion
      this.workout.workoutexercises.forEach(ex => {
        if (ex.id === workoutExerciseId) {
          ex.sets = ex.sets.filter(s => s.id !== set.id);
        }
      });
    });
  }

  saveSet(set: ExerciseSet, workoutExerciseId: number) {
    this.workoutService.saveSet(set, workoutExerciseId!).subscribe();
    set.isEditing = false; // Exit the edit mode
  }

  navigateToExerciseSelection(workoutId: number) {
    this.workoutId = workoutId;
    // Pass the workoutId via state when navigating to SelectExerciseComponent
    this.router.navigate(['/exercise/select'], { state: { workoutId: workoutId } });
  }

  navigateToWorkoutExerciseDetails(workoutexerciseId: number) {
    // Pass the workoutexerciseId via state when navigating to SelectExerciseComponent
    this.router.navigate(['/workout/workoutexercise'],
      {
        queryParams: { workoutexerciseId: workoutexerciseId },
        state: {
          workoutId: this.workoutId,
          workoutexerciseId: workoutexerciseId
        }
      });
  }

  createWorkoutWithTemplate(workout: Workout) {
    //TODO!
    }

  editTitleModeOn(){
    this.isTitleEditMode = true;
  }

  cancelEditTitle(){
    this.isTitleEditMode = false;
  }

    saveTitle(workoutTitle: string) {
      this.workout.title = workoutTitle;
      //TODO: workoutservice.save(...)
      this.workoutService.updateWorkout(this.workout).subscribe((data) => {
        this.workout = data;
      })
      this.isTitleEditMode = false;

  }


}
