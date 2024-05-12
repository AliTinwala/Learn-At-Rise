import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CalendarComponent } from './calendar/calendar.component';
import { RouterModule } from '@angular/router';
import { UserAuthModule } from '../user-auth/user-auth.module';

@NgModule({
  declarations: [
    CalendarComponent
  ],
  imports: [
    CommonModule,
    RouterModule,
    UserAuthModule
  ],
  exports: [
    CalendarComponent
  ]
})
export class HomeModule { }
