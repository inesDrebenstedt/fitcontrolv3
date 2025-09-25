import { Component } from '@angular/core';
import { ActionwidgetBlueComponent } from "@old_shared/components/actionwidget-blue/actionwidget-blue.component";
import { ActionwidgetComponent } from "@old_shared/components/actionwidget/actionwidget.component";
import { CommonModule} from '@angular/common';
import { XychartComponent } from "@old_shared/components/charts/xychart/xychart/xychart.component";
import { WorkoutService } from '@old_shared/services/workout.service';
import { AppUser } from 'src/app/core/model/appuser';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { AuthService } from '@old_shared/services/auth/auth.service';

@Component({
  standalone: true, 
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
  imports: [ActionwidgetBlueComponent, ActionwidgetComponent, CommonModule, XychartComponent],
})
export class HomeComponent{

  constructor(
    private workoutService: WorkoutService,
    public authService: AuthService,
     private router: Router,
      private http: HttpClient
  ) { }


  apiResponse: string | null = null;
  currentAppUser: AppUser | undefined;

  callSecuredApi() {
    this.http.get('/api/secured').subscribe({
      next: (data: any) => this.apiResponse = JSON.stringify(data),
      error: (err) => {
        console.error('API call failed:', err);
        this.apiResponse = `Error: ${err.status} - ${err.message || err.statusText}`;
      }
    });
  }

  onAction(arg0: string) {
    throw new Error('Method not implemented.');
  }
  navbarTitle: string = 'Home Page';
  actionTitles: Array<string> = ["Create Workout", "Create Exercise"];
  widgetTitles: Array<string> = ["Workouts list", "Exercise List"];

  showPrimaryMuscleGroupStats() {
  this.workoutService.getPrimaryMuscleGroupStats();
}

}
