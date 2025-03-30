import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { WorkoutDetailComponent } from './pages/workout-detail/workout-detail.component';
import { WorkoutListComponent } from './pages/workout-list/workout-list.component';
import { MatGridListModule } from '@angular/material/grid-list';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatToolbarModule } from '@angular/material/toolbar';
import { SharedModule } from 'src/app/shared/shared.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatCardModule } from '@angular/material/card'; 
import { DropdownModule } from 'primeng/dropdown';
import { ItemAccordionComponent } from '../test/item-accordion/item-accordion.component';
import { WorkoutCreateComponent } from './pages/workout-create/workout-create.component';


@NgModule({
  declarations: [
    WorkoutDetailComponent, 
    WorkoutListComponent,
    WorkoutCreateComponent,
    ItemAccordionComponent,
  ],
  imports: [
    CommonModule,
    SharedModule,
    MatGridListModule,
    MatButtonModule,
    MatIconModule,
    MatExpansionModule,
    MatToolbarModule,
    MatFormFieldModule,
    MatInputModule,
    FormsModule,
    ReactiveFormsModule,
    MatCardModule,
    DropdownModule,

    
  ],
  exports: [
    WorkoutDetailComponent, 
    WorkoutListComponent
  ]
})
export class WorkoutModule { }
