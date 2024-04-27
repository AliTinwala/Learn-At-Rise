import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CalendarComponent } from './home/calendar/calendar.component';
import { QuickBookingComponent } from './booking/quick-booking/quick-booking.component';

const routes: Routes = [
  { path: '', component: CalendarComponent},
  { path: 'calendar', component: CalendarComponent }, // Default route
  { path: 'booking', component: QuickBookingComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
