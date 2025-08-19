import { Component } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ExerciseClass } from '../../../../../core/class/exercise.class';
import { MuscleGroup } from '../../../../../core/enums/muscle-group';
import { ExerciseService } from '@old_shared/services/exercise.service';
import { MatFormFieldModule } from "@angular/material/form-field";
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-create-exercise',
  templateUrl: './create-exercise.component.html',
  styleUrls: ['./create-exercise.component.scss'],
  imports: [MatFormFieldModule, ReactiveFormsModule, CommonModule]
})
export class CreateExerciseComponent {
  createExerciseForm!: FormGroup;
  formControl: FormControl = new FormControl('');
  description: string = '';
  primaryMuscleGroupsList: MuscleGroup[] = [];
  secondaryMuscleGroupsList: MuscleGroup[] = [];
  // Convert enum to array of values
  muscleGroups = Object.values(MuscleGroup);

  // Model for the selected value
  selectedMuscleGroup: MuscleGroup | undefined;


  constructor(
    private fb: FormBuilder,
    private exerciseService: ExerciseService,
    private route: ActivatedRoute,
    private router: Router
  ) { }

  ngOnInit() {
    this.createExerciseForm = this.fb.group({
      titleField: [''],
      descriptionField: [''],
      primaryMuscleGroupsListInFg: [''],
      secondaryMuscleGroupsListInFg: [''],
    });
  }

  get titleField(): FormArray {
    return this.createExerciseForm!.get('titleField') as FormArray;
  }

  get getDescriptionField(): FormArray {
    return this.createExerciseForm!.get('descriptionField') as FormArray;
  }

  get getPrimaryMuscleGroupsList(): FormArray {
    return this.createExerciseForm!.get('primaryMuscleGroupsList') as FormArray;
  }

  get getSecondaryMuscleGroupsList(): FormArray {
    return this.createExerciseForm!.get('secondaryMuscleGroupsList') as FormArray;
  }


  onSubmit() {
    const title = this.createExerciseForm.get('titleField')?.value;
   const  description = this.createExerciseForm.get('descriptionField')?.value;
    //TODO in externe Methode packen
    let primaryMgValues: MuscleGroup[] = [];
    let secondaryMgValues: MuscleGroup[] = [];

    this.primaryMuscleGroupsList.forEach(pmg => {
        for (const [key, value] of Object.entries(MuscleGroup)) {
          // Check if the current value matches the enum value
          if (value === pmg) {
              console.log(`pmg Key: ${key}, pmg Value: ${value}`);
              primaryMgValues.push(value);
          }
      }
    });

    this.secondaryMuscleGroupsList.forEach(smg => {
      for (const [key, value] of Object.entries(MuscleGroup)) {
        // Check if the current value matches the enum value
        if (value === smg) {
            console.log(`smg Key: ${key}, smg Value: ${value}`);
            secondaryMgValues.push(value);
        }
    }
  });

    const newExercise = new ExerciseClass(0, title, description, primaryMgValues, secondaryMgValues);
    const result = undefined;
    this.exerciseService.saveExercise(newExercise).subscribe(() => {
      this.router.navigate(['/exercise/all'], { state: { comingFromExerciseCreationView: true } });
    });
  }

  // Method to add selected item to the list
  addMuscleGroup(primaryOrSecondaryMuscleGroupsList: MuscleGroup[], listType: string) {
    let selectedMuscleGroup = undefined;
    if (listType === 'primaryMuscleGroupsList') {
      selectedMuscleGroup = this.createExerciseForm.get('primaryMuscleGroupsListInFg')?.value;
    } else {
      selectedMuscleGroup = this.createExerciseForm.get('secondaryMuscleGroupsListInFg')?.value;
    }
//TODO: try remove primaryOrSecondaryMuscleGroupsList from params and use this. ...
    if (selectedMuscleGroup && !primaryOrSecondaryMuscleGroupsList.includes(selectedMuscleGroup)) {
      primaryOrSecondaryMuscleGroupsList.push(selectedMuscleGroup);
      console.log('..... addMuscleGroup ' + primaryOrSecondaryMuscleGroupsList.length + ', ' + JSON.stringify(selectedMuscleGroup))
      // Optionally, reset the selection
      this.createExerciseForm.get('primaryMuscleGroupsListInFg')?.setValue('');
      this.createExerciseForm.get('secondaryMuscleGroupsListInFg')?.setValue('');
    }
  }

}
