import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HomeComponent } from './home.component';
import { CommonModule, NgFor } from '@angular/common';
import { BrowserModule } from '@angular/platform-browser';
import { NO_ERRORS_SCHEMA } from '@angular/core';
import { ActionwidgetBlueComponent } from '@shared/components/actionwidget-blue/actionwidget-blue.component';
import { ActionwidgetComponent } from '@shared/components/actionwidget/actionwidget.component';
import { Component, Input, Output, EventEmitter } from '@angular/core';

// 1. Define Mock Components for app-actionwidget and app-widget
// These components mimic the interface (selector, inputs, outputs)
// of the actual child components, but with minimal implementation.
// Assuming your original components are standalone, the mocks should also be.
/*
@Component({
  selector: 'app-actionwidget', // Must match the selector used in HomeComponent's template
  template: `<div><!-- Mock Action Widget --></div>`, // Minimal template
  standalone: true // If the real component is standalone
})
class MockActionWidgetComponent {
  @Input() title: string | undefined;
  @Output() actionClick = new EventEmitter<string>();
  // Add any other @Input() or @Output() properties that the real
  // app-actionwidget component uses and HomeComponent interacts with.
}


@Component({
  selector: 'app-widget', // Must match the selector used in HomeComponent's template
  template: `<div><!-- Mock Widget --></div>`, // Minimal template
  standalone: true // If the real component is standalone
})
class MockWidgetComponent {
  @Input() title: string | undefined;
  // Add any other @Input() or @Output() properties that the real
  // app-widget component uses.
}
  */

describe('HomeComponent', () => {
  let component: HomeComponent;
  let fixture: ComponentFixture<HomeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      // HomeComponent is a standalone component, so it's directly imported into the testing module.
      // Its own `imports` array will handle its standalone dependencies (ActionwidgetBlueComponent, ActionwidgetComponent).
      imports: [HomeComponent],
      
      // Use NO_ERRORS_SCHEMA to prevent issues if ActionwidgetBlueComponent
      // or ActionwidgetComponent have complex templates or dependencies that are not needed
      // for testing the HomeComponent's logic directly. This effectively tells Angular
      // to ignore these child components during template parsing for this test.
      schemas: [NO_ERRORS_SCHEMA]
    }).compileComponents(); // Compile components for the test module

    fixture = TestBed.createComponent(HomeComponent); // Create an instance of HomeComponent
    component = fixture.componentInstance; // Get the component instance
    fixture.detectChanges(); // Trigger initial change detection, which runs ngOnInit etc.
  });

  it('should create the component', () => {
    expect(component).toBeTruthy();
  });

  it('should have navbarTitle set to "Home Page"', () => {
    expect(component.navbarTitle).toBe('Home Page');
  });

  it('should have actionTitles set correctly', () => {
    expect(component.actionTitles).toEqual(['Create Workout', 'Create Exercise']);
  });

  it('should have widgetTitles set correctly', () => {
    expect(component.widgetTitles).toEqual(['Workouts list', 'Exercise List']);
  });

  it('should expose the onAction method', () => {
    expect(typeof component.onAction).toBe('function');
  });

  it('onAction method should throw "Method not implemented." as per current implementation', () => {
    const testArg = 'some test action';
    // We expect the method to throw an error because of its current implementation
    expect(() => component.onAction(testArg)).toThrow('Method not implemented.');
  });

  // If you had the template (home.component.html) and wanted to test rendering or interactions:
  /*
  // Example of testing if a child component for 'Create Workout' is rendered
  // This would require either not using NO_ERRORS_SCHEMA and importing the actual components,
  // or mocking the child components with specific selectors and outputs.
  // With NO_ERRORS_SCHEMA, you can only query for generic HTML elements.
  it('should render correct number of actionwidget-blue components (if template provided)', () => {
    // This assumes your template uses something like:
    // <app-actionwidget-blue *ngFor="let title of actionTitles" [title]="title" ...></app-actionwidget-blue>
    // Note: With NO_ERRORS_SCHEMA, we can only query by CSS selector, not by component instance.
    const blueWidgets = fixture.debugElement.queryAll(By.css('app-actionwidget-blue'));
    expect(blueWidgets.length).toBe(component.actionTitles.length);

    // You could also test event emissions if you had mocked the child components
    // and weren't using NO_ERRORS_SCHEMA.
    // E.g., const spy = jest.spyOn(component, 'onAction');
    // blueWidgets[0].triggerEventHandler('action', 'some-value');
    // expect(spy).toHaveBeenCalledWith('some-value');
  });
  */
});
