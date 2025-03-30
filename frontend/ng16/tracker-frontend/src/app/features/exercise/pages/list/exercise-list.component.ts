import { Component, OnInit } from '@angular/core';
import { ExerciseService } from 'src/app/shared/services/exercise.service';
import { ActivatedRoute } from '@angular/router';
import { Exercise } from 'src/app/core/model/exercise';
import { Router, } from '@angular/router';
import { MuscleGroup } from 'src/app/core/enums/muscle-group';
import { FormBuilder, FormControl, FormGroup } from '@angular/forms';


@Component({
  selector: 'app-exercise-list',
  templateUrl: './exercise-list.component.html',
  styleUrls: ['./exercise-list.component.scss']
})
export class ExerciseListComponent {

  constructor(
    private fb: FormBuilder,
    private exerciseService: ExerciseService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  navbarTitle: string = 'List of Exercises TODO';
  exercises: Exercise[] | undefined;
  comingFromExerciseCreationView: Boolean | undefined;
  muscleGroupSelected: MuscleGroup | undefined;
  // Convert enum to array of values
  allMuscleGroups = Object.values(MuscleGroup);
  chooseMuscleGroupForm: FormGroup = this.fb.group({});
  formControl: FormControl = new FormControl('');


  ngOnInit(): void {
    /*
    this.exerciseService.getExercises().subscribe(data => {
      this.exercises = data;
    });
    */
   this.getExerciseData();

    this.chooseMuscleGroupForm = this.fb.group({
      selectedMuscleGroupInFg: '',
    });

  }

  getExerciseData(){
    this.exerciseService.getExercises().subscribe(data => {
      this.exercises = data;
    });
  }

  onTileClick(exerciseId: number): void {
    this.router.navigate(['exercise/singleexercise'],
      { queryParams: { exerciseId: exerciseId } });
  }

  createNewExercise() {
    //TODO
    this.router.navigate(['/exercise/create']);
  }

  filterByMuscleGroup() {
    let selectedMuscleGroup = this.chooseMuscleGroupForm.get('selectedMuscleGroupInFg')?.value;

    let filteredExercises: Exercise[] = [];
    this.exercises?.forEach(exercise => {
      exercise.primaryMuscleGroups.forEach(muscleGroup => {
        console.log('. . . . 1. . . . exercise.title = ' + exercise.title + ', muscleGroup = ' + muscleGroup + ', selectedMuscleGroup = ' + selectedMuscleGroup)
        if(muscleGroup === selectedMuscleGroup.replace(' ', '_')){
          filteredExercises.push(exercise);
        }
      })
    });
    this.exercises = filteredExercises;

    console.log('. . . . 3. . . . ' + this.exercises.length)
//TODO reset filter and with it this.exercises
  }

  resetFilter() {
    this.getExerciseData();
    }

}
