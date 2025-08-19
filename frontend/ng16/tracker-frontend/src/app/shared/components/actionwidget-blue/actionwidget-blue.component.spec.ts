import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ActionwidgetBlueComponent } from './actionwidget-blue.component';

describe('ActionwidgetBlueComponent', () => {
  let component: ActionwidgetBlueComponent;
  let fixture: ComponentFixture<ActionwidgetBlueComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ActionwidgetBlueComponent]
    });
    fixture = TestBed.createComponent(ActionwidgetBlueComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
