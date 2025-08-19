import { ExerciseDetailsComponent } from './exercise-details.component';
import { MuscleGroup } from 'src/app/core/enums/muscle-group';
import { ExerciseService } from 'src/app/shared/services/exercise.service';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { BehaviorSubject, of } from 'rxjs';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ActivatedRoute } from '@angular/router';
import { ReactiveFormsModule } from '@angular/forms';


const mockExercise = [
  {
        "id": 1,
        "title": "Bulgarian Split Squats",
        "description": "",
        "primaryMuscleGroups": [MuscleGroup.Gluteus_Maximus, MuscleGroup.Gluteus_Medius],
        "secondaryMuscleGroups":  [MuscleGroup.Gluteus_Minimus]
  }
];

describe('ExerciseDetailsComponent', () => {
  let exerciseComponentVariable: ExerciseDetailsComponent;
  let fixture: ComponentFixture<ExerciseDetailsComponent>;
  let exerciseServiceSpy: jasmine.SpyObj<ExerciseService>;

    beforeEach(async () => {
    const getExercisesSpy = jasmine.createSpyObj('ExerciseService', ['getExercise']);
    const queryParamsSubject = new BehaviorSubject({ exerciseId: '1' });

    await TestBed.configureTestingModule({
      declarations: [ExerciseDetailsComponent],
      imports: [HttpClientTestingModule,  ReactiveFormsModule,],
      providers: [
        { provide: ExerciseService, useValue: getExercisesSpy },
        {
          provide: ActivatedRoute,
          useValue: {
            queryParams: queryParamsSubject.asObservable() //mocks the expected observable
          }
        }
      ]
    }).compileComponents();
    
    fixture = TestBed.createComponent(ExerciseDetailsComponent);
    exerciseComponentVariable = fixture.componentInstance;
    exerciseServiceSpy = TestBed.inject(ExerciseService) as jasmine.SpyObj<ExerciseService>;
  });

    it('should fetch and display individuals on init', () => {
    exerciseServiceSpy.getExercise.and.returnValue(of(mockExercise[0]));

    fixture.detectChanges(); // triggers ngOnInit

    expect(exerciseComponentVariable.exercise?.title).toBe('Bulgarian Split Squats');

    // Optionally verify UI
    const compiled = fixture.nativeElement as HTMLElement;
    const listItems = compiled.querySelectorAll('li');
    expect(listItems.length).toBe(3);
    expect(listItems[0].textContent).toContain('Gluteus Maximus');
  });
    
/*
  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ExerciseDetailsComponent]
    });
    fixture = TestBed.createComponent(ExerciseDetailsComponent);
    exerciseComponentVariable = fixture.componentInstance;
    fixture.detectChanges();
  });
  */

  it('should create', () => {
    expect(exerciseComponentVariable).toBeTruthy();
  });
});
