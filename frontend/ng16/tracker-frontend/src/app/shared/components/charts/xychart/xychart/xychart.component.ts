import { Component, OnInit, AfterViewInit, ElementRef, ViewChild } from '@angular/core';
import { Chart, ChartConfiguration, ChartType, CategoryScale, LinearScale, BarElement, BarController,
     LineController,
  LineElement,
  PointElement,
  Title,
  Tooltip,
  Legend 
} from 'chart.js';

@Component({
  selector: 'app-xychart',
  //template: `<canvas #chartCanvas width="600" height="400"></canvas>`,
  standalone: true,
  templateUrl: './xychart.component.html',
  styleUrls: ['./xychart.component.css']
})
export class XychartComponent implements OnInit, AfterViewInit  {

    @ViewChild('chartCanvas') canvas!: ElementRef<HTMLCanvasElement>;

  constructor() { }

  ngAfterViewInit() {
    const config: ChartConfiguration<'line'> = {
      type: 'line',
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        datasets: [{
          label: 'Sales',
          data: [12, 19, 3, 5, 2, 3],
          borderColor: 'blue',
          backgroundColor: 'lightblue',
          fill: false,
          tension: 0.1
        }]
      },
      options: {
        scales: {
          x: { title: { display: true, text: 'Months' } },
          y: { title: { display: true, text: 'Value' }, beginAtZero: true }
        }
      }
    };
    new Chart(this.canvas.nativeElement.getContext('2d')!, config);
  }

  ngOnInit() {
    Chart.register(CategoryScale, LinearScale, BarElement, BarController, LineController,
  LineElement,
  PointElement,
  Title,
  Tooltip,
  Legend );
  }

}
