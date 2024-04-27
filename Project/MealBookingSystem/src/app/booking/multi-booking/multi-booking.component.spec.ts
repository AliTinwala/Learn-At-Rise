import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MultiBookingComponent } from './multi-booking.component';

describe('MultiBookingComponent', () => {
  let component: MultiBookingComponent;
  let fixture: ComponentFixture<MultiBookingComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [MultiBookingComponent]
    });
    fixture = TestBed.createComponent(MultiBookingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
