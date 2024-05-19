import { NgModule } from '@angular/core';
import { AddBookingComponent } from './add-booking/add-booking.component';
import { ViewBookingComponent } from './view-booking/view-booking.component';
import { UpdateBookingComponent } from './update-booking/update-booking.component';
import { SharedModule } from '../shared/shared.module';



@NgModule({
  declarations: [
    AddBookingComponent,
    ViewBookingComponent,
    UpdateBookingComponent
  ],
  imports: [
    SharedModule
  ]
})
export class BookingModule { }
