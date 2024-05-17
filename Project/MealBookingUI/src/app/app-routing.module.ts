import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AddBookingComponent } from './booking/add-booking/add-booking.component';
import { ViewBookingComponent } from './booking/view-booking/view-booking.component';
import { UpdateBookingComponent } from './booking/update-booking/update-booking.component';

const routes: Routes = [
  { path: '', component: ViewBookingComponent},
  { path: 'booking', component: ViewBookingComponent},
  { path:'add-booking', component: AddBookingComponent},
  { path: 'update-booking', component: UpdateBookingComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
export const ArrayOfComponents = 
[
  AddBookingComponent,
  UpdateBookingComponent,
  ViewBookingComponent,
]