import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ItemAccordionComponent } from './item-accordion.component';

describe('ItemAccordionComponent', () => {
  let component: ItemAccordionComponent;
  let fixture: ComponentFixture<ItemAccordionComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ItemAccordionComponent]
    });
    fixture = TestBed.createComponent(ItemAccordionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
