import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ActionwidgetComponent } from './actionwidget.component';

describe('ActionwidgetComponent', () => {
  let component: ActionwidgetComponent;
  let fixture: ComponentFixture<ActionwidgetComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ActionwidgetComponent]
    });
    fixture = TestBed.createComponent(ActionwidgetComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
