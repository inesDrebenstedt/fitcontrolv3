import { Component, Input } from '@angular/core';
import { Router, UrlSerializer, UrlTree   } from '@angular/router';

@Component({
  selector: 'app-actionwidget',
  templateUrl: './actionwidget.component.html',
  styleUrls: ['./actionwidget.component.scss']
})
export class ActionwidgetComponent {
  @Input('widgetTitle') widgetTitle: string = 'default action widget title';
  
  constructor(
    private router: Router, 
    private urlSerializer: UrlSerializer
  ) { }

  onActionClick (event: MouseEvent, widgetTitle: string) {

    switch (widgetTitle) {
      case 'Workouts list':
        // this.router.navigate(['workout/all']);
         this.router.navigateByUrl(`workout/all`).then(() => console.log(`It worked! Navigated`));

        const urlTree: UrlTree = this.router.createUrlTree(['workout/all']);
        const urlString = this.urlSerializer.serialize(urlTree);
        console.log('Constructed URL:', urlString);
      break;
      case 'Create Workout':
        this.router.navigate(['workout/create']);
       
        break;
      case 'Exercise List':
        this.router.navigate(['exercise/all']);
        break;
      case 'Create Exercise':
        this.router.navigate(['exercise/create']);
        break;
      default:
  }
 }

}
