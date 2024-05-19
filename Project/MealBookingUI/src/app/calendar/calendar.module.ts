import { NgModule } from '@angular/core';
import { ViewCalendarComponent } from './view-calendar/view-calendar.component';
import { SharedModule } from '../shared/shared.module';



@NgModule({
  declarations: [
    ViewCalendarComponent
  ],
  imports: [
    SharedModule
  ]
})
export class CalendarModule { }
