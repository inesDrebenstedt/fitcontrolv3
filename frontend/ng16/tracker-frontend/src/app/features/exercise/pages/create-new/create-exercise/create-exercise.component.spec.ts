import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HttpClientModule } from '@angular/common/http';
import { Router, ActivatedRoute } from '@angular/router';
import { of } from 'rxjs';

// 🔥 Angular Material
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';

// Angular Core
import { ReactiveFormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

// Component under test
import { CreateExerciseComponent } from './create-exercise.component';
import { ExerciseService } from '@old_shared/services/exercise.service';
import { ExerciseClass } from '../../../../../core/class/exercise.class';

//  mocked ExerciseService for mocked HTTP calls
class MockExerciseService {
  saveExercise() {
    return of({}); // Simulated observable
  }
}

describe('CreateExerciseComponent', () => {
  let component: CreateExerciseComponent;
  let fixture: ComponentFixture<CreateExerciseComponent>;
  let exerciseService: ExerciseService;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [
        CreateExerciseComponent, // standalone component
        CommonModule,
        ReactiveFormsModule,
        HttpClientModule, // skip if mocking ExerciseService
        MatFormFieldModule,
        MatInputModule, 
      ],
      providers: [
        {
          provide: ActivatedRoute,
          useValue: {
            snapshot: { params: {} },
            paramMap: {
              get: () => null
            }
          }
        },
        {
          provide: Router,
          useValue: {
            navigate: jest.fn()
          }
        }, 
        ExerciseService
        /*
        {
          provide: 'ExerciseService',
          useClass: MockExerciseService
        }
          */
      ]
    }).compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateExerciseComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();

    exerciseService = TestBed.inject(ExerciseService);
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });


  it('should trigger saving the new exercise', () => {
    component.titleOfNewExercise = 'newExercise';
    component.descriptionOfNewExercise = 'test description';
    let newExercise: ExerciseClass = new ExerciseClass(
      0, component.titleOfNewExercise, 
      component.descriptionOfNewExercise, 
      [], 
      []
    );
    const spy = jest.spyOn(exerciseService, 'saveExercise').mockReturnValue(of(newExercise));
    component.onSubmit();
    expect(spy).toHaveBeenCalledTimes(1);
  });

});
