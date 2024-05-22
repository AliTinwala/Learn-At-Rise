import { Component,OnInit } from '@angular/core';
import { NativeDateAdapter } from '@angular/material/core';
import { DatePipe } from '@angular/common';
import { BookingService } from 'src/app/shared/booking/booking.service';
import { MatDatepickerInputEvent } from '@angular/material/datepicker';

@Component({
  selector: 'app-view-calendar',
  templateUrl: './view-calendar.component.html',
  styleUrls: ['./view-calendar.component.css'],
  providers: [NativeDateAdapter,DatePipe]
})
export class ViewCalendarComponent{
  
  selectedDate: Date | null = null;
  
  constructor(public bookingService: BookingService,private datePipe: DatePipe){ }

  onDateChange(event: MatDatepickerInputEvent<Date>): void 
  {
    this.selectedDate = event.value;
    console.log('Selected date: ', this.selectedDate); 
  }
}
