import { NgModule } from '@angular/core';
import { ViewCalendarComponent } from './view-calendar/view-calendar.component';
import { SharedModule } from '../shared/shared.module';
import { MatDivider } from '@angular/material/divider';

@NgModule({
  declarations: [
  ],
  imports: [
    SharedModule,
  ],
  providers:[ ]
})
export class CalendarModule { }
