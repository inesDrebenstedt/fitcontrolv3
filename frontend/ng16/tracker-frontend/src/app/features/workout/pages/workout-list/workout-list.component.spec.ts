import { ComponentFixture, TestBed } from '@angular/core/testing';
import { WorkoutListComponent } from './workout-list.component';
import { WorkoutService } from '../../../../shared/services/workout.service';
import { ActivatedRoute, Router } from '@angular/router';
import { of } from 'rxjs';

// Mock WorkoutService
const workoutServiceMock = {
  getWorkouts: jest.fn(() => of([]))  // stub method returning empty observable
};

// Mock ActivatedRoute and Router
const activatedRouteMock = {
  snapshot: { params: {} },
  // Add other mock properties/methods if used
};

const routerMock = {
  navigate: jest.fn()
};

describe('WorkoutListComponent', () => {
  let component: WorkoutListComponent;
  let fixture: ComponentFixture<WorkoutListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [WorkoutListComponent] // standalone components can be imported directly here
    })
      .overrideProvider(WorkoutService, { useValue: workoutServiceMock })
      .overrideProvider(ActivatedRoute, { useValue: activatedRouteMock })
      .overrideProvider(Router, { useValue: routerMock })
      .compileComponents();

    fixture = TestBed.createComponent(WorkoutListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges(); // trigger initial data binding
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should have navbarTitle', () => {
    expect(component.navbarTitle).toBe('List of Workouts');
  });

  it('should call workoutService.getWorkouts on init', () => {
    const spy = jest.spyOn(workoutServiceMock, 'getWorkouts');
    component.ngOnInit();
    expect(spy).toHaveBeenCalled();
  });


  // Add more tests here, e.g., testing navigation, filtering, etc.

});
