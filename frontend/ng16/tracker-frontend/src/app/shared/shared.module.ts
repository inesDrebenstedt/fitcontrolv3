import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MaterialModule } from './material/material/material.module';
import { MatMenuModule } from '@angular/material/menu';
import { MatButtonModule } from '@angular/material/button';
import { ActionwidgetComponent } from './components/actionwidget/actionwidget.component';
import { ActionwidgetBlueComponent } from 'src/app/shared/components/actionwidget-blue/actionwidget-blue.component';
import { NavbarComponent } from './components/navbar/navbar/navbar.component';


@NgModule({
  declarations: [
    ActionwidgetComponent,
    NavbarComponent,
    ActionwidgetBlueComponent,

  ],
  imports: [
    CommonModule,
    MaterialModule,
    MatMenuModule,
    MatButtonModule,
    
  ],
  exports: [
    ActionwidgetComponent, 
    NavbarComponent,
    ActionwidgetBlueComponent,
  ]
})
export class SharedModule { }
