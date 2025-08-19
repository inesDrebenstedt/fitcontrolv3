import { ComponentFixture, TestBed } from '@angular/core/testing';
import { WorkoutListComponent } from './workout-list.component';
import { WorkoutService } from '../../../../shared/services/workout.service';
import { ActivatedRoute, Router } from '@angular/router';
import { of } from 'rxjs';
import { HttpClientModule } from '@angular/common/http';

describe('WorkoutListComponent integration test', () => {
  let component: WorkoutListComponent;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [
        WorkoutListComponent,
        HttpClientModule // real HttpClient for actual backend calls
      ],
      providers: [
        WorkoutService,
        { provide: ActivatedRoute, useValue: { snapshot: { params: {} } } },
        { provide: Router, useValue: { navigate: jest.fn() } }
      ]
    }).compileComponents();

    const fixture = TestBed.createComponent(WorkoutListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should fetch workouts from real backend', (done) => {
    component.ngOnInit();

    // The service call is async, so wait for workouts to load
    setTimeout(() => {
      expect(component.workouts).toBeDefined();
      expect(component.workouts!.length).toBeGreaterThan(0);
      expect(component.workouts![0].title).toEqual('test');
      done();
    }, 2000); // wait 2 seconds for HTTP response (adjust as needed)
  });
});
