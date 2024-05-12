import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CalendarComponent } from './home/calendar/calendar.component';
import { QuickBookingComponent } from './booking/quick-booking/quick-booking.component';
import { LoginComponent } from './user-auth/login/login.component';
import { ForgotPasswordComponent } from './user-auth/forgot-password/forgot-password.component';

const routes: Routes = [
  { path: '', component:LoginComponent },
  { path: 'login', component: LoginComponent },
  { path: 'calendar', component: CalendarComponent }, 
  { path: 'booking', component: QuickBookingComponent },
  { path: 'forgot-password', component: ForgotPasswordComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
