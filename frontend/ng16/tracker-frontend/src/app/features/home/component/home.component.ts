import { Component } from '@angular/core';
import { ActionwidgetBlueComponent } from "@old_shared/components/actionwidget-blue/actionwidget-blue.component";
import { ActionwidgetComponent } from "@old_shared/components/actionwidget/actionwidget.component";
import { CommonModule} from '@angular/common';
import { XychartComponent } from "@old_shared/components/charts/xychart/xychart/xychart.component";

@Component({
  standalone: true, 
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss'],
  imports: [ActionwidgetBlueComponent, ActionwidgetComponent, CommonModule, XychartComponent],
})
export class HomeComponent {
  onAction(arg0: string) {
    throw new Error('Method not implemented.');
  }
  navbarTitle: string = 'Home Page';
  actionTitles: Array<string> = ["Create Workout", "Create Exercise"];
  widgetTitles: Array<string> = ["Workouts list", "Exercise List"];

}
