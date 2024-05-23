import { Component,OnInit, TemplateRef } from '@angular/core';
import { DateAdapter, NativeDateAdapter } from '@angular/material/core';
import { DatePipe, NgIfContext } from '@angular/common';
import { BookingService } from 'src/app/shared/booking/booking.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-view-calendar',
  templateUrl: './view-calendar.component.html',
  styleUrls: ['./view-calendar.component.css'],
  providers: [NativeDateAdapter,DatePipe]
})
export class ViewCalendarComponent implements OnInit{
  
  selectedDate: Date | null = null;
  user_id: number = 0;
  bookedDates$: Date[] = [];
  
  constructor(public bookingService: BookingService,private datePipe: DatePipe, private dateAdapter: DateAdapter<Date>){ }

  ngOnInit(): void 
  {
        
  }

  onDateChange(event: any): void 
  {
    if (event) 
    {
      this.selectedDate = new Date(event);
    } 
    else 
    {
      console.error('Invalid event or value:', event);
    }
  }

}
