import { NgModule } from '@angular/core';
import { BookingComponent } from './booking/booking.component';
import { SharedModule } from '../shared/shared.module';
import { CalendarComponent } from './calendar/calendar.component';
import { AppRoutingModule } from '../app-routing.module';
@NgModule({
  declarations: [
    BookingComponent,
    CalendarComponent,
  ],
  imports: [
    SharedModule,
    AppRoutingModule
  ],
  providers: [],
  exports: [
    BookingComponent,
    CalendarComponent,
  ]
})
export class HomeModule { }
