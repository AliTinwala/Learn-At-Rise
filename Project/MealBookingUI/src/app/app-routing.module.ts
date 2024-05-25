import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddBookingComponent } from './booking/add-booking/add-booking.component';
import { ViewBookingComponent } from './booking/view-booking/view-booking.component';
import { ViewCalendarComponent } from './calendar/view-calendar/view-calendar.component';

const routes: Routes = [
  { path: '', component: ViewBookingComponent},
  { path: 'view-booking', component: ViewBookingComponent},
  { path: 'add-booking', component: AddBookingComponent},
  { path: 'view-calendar', component:ViewCalendarComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
export const ArrayOfComponents = 
[
  ViewBookingComponent,
  AddBookingComponent,
  ViewCalendarComponent
]