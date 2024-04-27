import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { QuickBookingComponent } from './quick-booking/quick-booking.component';
import { MultiBookingComponent } from './multi-booking/multi-booking.component';
import { CancelBookingComponent } from './cancel-booking/cancel-booking.component';



@NgModule({
  declarations: [
    QuickBookingComponent,
    MultiBookingComponent,
    CancelBookingComponent
  ],
  imports: [
    CommonModule
  ]
})
export class BookingModule { }
