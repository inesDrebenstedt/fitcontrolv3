import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { MuscleGroup } from 'src/app/core/enums/muscle-group';
import { Exercise } from 'src/app/core/model/exercise';
import { ExerciseSet } from 'src/app/core/model/exercise-set';
import { ExerciseService } from 'src/app/shared/services/exercise.service';

@Component({
  selector: 'app-exercise-details',
  templateUrl: './exercise-details.component.html',
  styleUrls: ['./exercise-details.component.scss']
})
export class ExerciseDetailsComponent {


  constructor(
    //private workoutService: WorkoutService, 
    private fb: FormBuilder,
    private exerciseService: ExerciseService,
    private route: ActivatedRoute,
    private router: Router,

  ) { }

  editPrimaryMuscleGroupsForm: FormGroup = this.fb.group({});
  editSecondaryMuscleGroupsForm: FormGroup = this.fb.group({});
  navbarTitle: string = 'default workout navbar title';
  exercise: Exercise | undefined;
  primaryMuscleGroupsList: MuscleGroup[] = [];
  secondaryMuscleGroupsList: MuscleGroup[] = [];
  // Convert enum to array of values
  muscleGroupValues = Object.values(MuscleGroup);
  muscleGroupKeys = Object.keys(MuscleGroup);


  // Model for the selected value
  selectedMuscleGroup: MuscleGroup | undefined;


  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      console.log('... ' + params)
      const id = params['exerciseId'];
      if (id) {

        this.exerciseService.getExercise(id).subscribe(data => {
          this.exercise = data;
          this.navbarTitle = 'TODO 2 !';
        });
      }
    });

    this.editPrimaryMuscleGroupsForm = this.fb.group({
      primaryMuscleGroupsListInFg: [''],
    });

    this.editSecondaryMuscleGroupsForm = this.fb.group({
      secondaryMuscleGroupsListInFg: [''],
    });
  }

  getSetsAsArray(sets: Map<string, ExerciseSet>): { key: string, value: ExerciseSet }[] {
    return Array.from(sets.entries()).map(([key, value]) => ({ key, value }));
  }

  deleteMuscleGroupFrom(arg0: string[]) {
    throw new Error('Method not implemented.');
  }

  addMuscleGroup(primaryOrSecondaryMuscleGroupsList: MuscleGroup[], listType: string) {
    let selectedMuscleGroup = undefined;
    if (listType === 'primaryMuscleGroupsList') {
      selectedMuscleGroup = this.editPrimaryMuscleGroupsForm.get('primaryMuscleGroupsListInFg')?.value;
    } else {
      selectedMuscleGroup = this.editSecondaryMuscleGroupsForm.get('secondaryMuscleGroupsListInFg')?.value;
    }
    //TODO: try remove primaryOrSecondaryMuscleGroupsList from params and use this. ...
    if (selectedMuscleGroup && !primaryOrSecondaryMuscleGroupsList.includes(selectedMuscleGroup)) {
      primaryOrSecondaryMuscleGroupsList.push(selectedMuscleGroup);
      console.log('..... addMuscleGroup ' + primaryOrSecondaryMuscleGroupsList.length + ', ' + JSON.stringify(selectedMuscleGroup))
      // Optionally, reset the selection
      this.editPrimaryMuscleGroupsForm.get('primaryMuscleGroupsListInFg')?.setValue('');
      this.editSecondaryMuscleGroupsForm.get('secondaryMuscleGroupsListInFg')?.setValue('');
    }

    if (listType === 'primaryMuscleGroupsList') {
      primaryOrSecondaryMuscleGroupsList.forEach(mg => {
        this.exercise!.primaryMuscleGroups.push(mg)
      })
    } else {
      primaryOrSecondaryMuscleGroupsList.forEach(mg => {
        this.exercise!.secondaryMuscleGroups.push(mg)
      })
    }
  }

  onSubmit() {
//TODO: problem with enum values from FE to BE
    this.exerciseService.updateExercise(this.exercise!).subscribe(() => {
      this.router.navigate(['/exercise/singleexercise'],  { queryParams: { exerciseId: this.exercise?.id } , state: { comingFromExerciseCreationView: true } });
    });
  }


  onDelete() {
    this.exerciseService.deleteExercise(this.exercise!.id!).subscribe(() => {
      this.router.navigate(['/exercise/all'],  { queryParams: { exerciseId: this.exercise?.id } , state: { comingFromExerciseCreationView: true } });
    });
    }

}
