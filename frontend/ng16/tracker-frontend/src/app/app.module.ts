import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module'; 
import { AppComponent } from './app.component';
import { HomeModule } from './features/home/home.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { SharedModule } from './shared/shared.module';
import { WorkoutModule } from './features/workout/workout.module';
import { WorkoutExerciseModule } from './features/workoutexercise/workoutexercise.module';
import { HttpClientModule } from '@angular/common/http';
import { WorkoutService } from './shared/services/workout.service';
import { ExerciseModule } from './features/exercise/exercise.module';
import { ExerciseService } from './shared/services/exercise.service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { StopClickPropagationDirective } from './directives/stop-click-propagation.directive';
import { LoginComponent } from './features/login/login/login.component';
import { LoginModule } from './features/login/login.module';
import { XychartComponent } from "./shared/components/charts/xychart/xychart/xychart.component";

@NgModule({
  declarations: [AppComponent, 
    StopClickPropagationDirective, 
    
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    AppRoutingModule,
    HomeModule,
    WorkoutModule,
    WorkoutExerciseModule,
    ExerciseModule,
    SharedModule,
    LoginModule,
    BrowserAnimationsModule,
    XychartComponent
], 
  providers: [
    WorkoutService, 
    ExerciseService
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
