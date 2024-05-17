import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './user-auth/login/login.component';
import { BookingComponent } from './home/booking/booking.component';
import { ForgotPasswordComponent } from './user-auth/forgot-password/forgot-password.component';
import { ChangePasswordComponent } from './user-auth/change-password/change-password.component';
import { CalendarComponent } from './home/calendar/calendar.component';
import { RegistrationComponent } from './user-auth/registration/registration.component';

const routes: Routes = [
  { path: '', component: LoginComponent }, 
  { path: 'login', component: LoginComponent },
  { path: 'register', component:RegistrationComponent},
  { path: 'forgot-password', component: ForgotPasswordComponent },
  { path: 'change-password', component: ChangePasswordComponent },
  { path: 'calendar', component: CalendarComponent},
  { path: 'booking', component: BookingComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }