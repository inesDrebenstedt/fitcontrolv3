import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent {
  onAction(arg0: string) {
    throw new Error('Method not implemented.');
  }
  navbarTitle: string = 'Home Page';
  actionTitles: Array<string> = ["Create Workout", "Create Exercise"];
  widgetTitles: Array<string> = ["Workouts list", "Exercise List"];

}
