import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AddBookingComponent } from './add-booking/add-booking.component';
import { ViewBookingComponent } from './view-booking/view-booking.component';
import { UpdateBookingComponent } from './update-booking/update-booking.component';



@NgModule({
  declarations: [
    AddBookingComponent,
    ViewBookingComponent,
    UpdateBookingComponent
  ],
  imports: [
    CommonModule
  ]
})
export class BookingModule { }
