import { ComponentFixture, TestBed } from '@angular/core/testing';

import { WorkoutexerciseDetailComponent } from './workoutexercise-detail.component';

describe('WorkoutexerciseDetailComponent', () => {
  let component: WorkoutexerciseDetailComponent;
  let fixture: ComponentFixture<WorkoutexerciseDetailComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [WorkoutexerciseDetailComponent]
    });
    fixture = TestBed.createComponent(WorkoutexerciseDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
