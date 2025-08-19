import { ComponentFixture, TestBed } from '@angular/core/testing';
import { ExerciseComponent } from './exercise.component';
import { MuscleGroup } from 'src/app/core/enums/muscle-group';
import { ExerciseService } from 'src/app/shared/services/exercise.service';
import { HttpClientTestingModule } from '@angular/common/http/testing';
import { of } from 'rxjs';


describe('ExerciseComponent', () => {
  let exerciseComponentVariable: ExerciseComponent;
  let fixture: ComponentFixture<ExerciseComponent>;
  
  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ExerciseComponent]
    });
    fixture = TestBed.createComponent(ExerciseComponent);
    exerciseComponentVariable = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(exerciseComponentVariable).toBeTruthy();
  });
});
