import { Component,OnInit } from '@angular/core';
import { DateAdapter, NativeDateAdapter } from '@angular/material/core';
import { DatePipe } from '@angular/common';
import { BookingService } from 'src/app/shared/booking/booking.service';
import { Observable, map, skip } from 'rxjs';
import {MatCalendarCellClassFunction, MatCalendarCellCssClasses} from '@angular/material/datepicker';

@Component({
  selector: 'app-view-calendar',
  templateUrl: './view-calendar.component.html',
  styleUrls: ['./view-calendar.component.css'],
  providers: [NativeDateAdapter,DatePipe]
})
export class ViewCalendarComponent implements OnInit{
  selectedDate: Date | null = null;
  mealBooked: string = '';
  user_id: number = 0;
  bookedDates$: Observable<Date[]> | Date[] = [];
  isBooked: boolean = false;
  myClass: string = '';
  
  constructor(public bookingService: BookingService,public datePipe: DatePipe, public dateAdapter: DateAdapter<Date>){ }

  ngOnInit(): void 
  {
    this.fetchBookedDates();
  }

  dateClass() {
    return (date:Date): MatCalendarCellCssClasses => {
      for(i=0;i<)
      if(date === ){
        return 'booking-dates';
      }
      else{
        return '';
      }
    };
  }

  fetchBookedDates(): Observable<Date[]> | Date [] {
    this.bookingService.getBookedDates(this.user_id)
      .subscribe(response => {
        this.bookedDates$ = response;
      }, error => {
        // Handle error gracefully
        console.error('Error fetching booked dates:', error);
        // Optionally display an error message to the user
      });
      return this.bookedDates$;
  }

  onDateChange(event: any): string  {
    if(event) 
    {
      this.selectedDate = event;
      const formatDate = this.datePipe.transform(this.selectedDate,'yyyy-MM-dd');
      if( this.bookedDates$ instanceof Observable)
      {
        this.bookedDates$.pipe(
          map(dates => dates.map(date => this.datePipe.transform(date,'yyyyMM-dd')))
        )
        .subscribe(formattedBookedDates => {
          for (const formattedDate of formattedBookedDates) {
            if (formattedDate === formatDate) {
              this.isBooked = true;
              break;
            }
            else if(formattedDate != formatDate)
            {
              this.isBooked = false;
            } 
          }
        });
        if(this.isBooked === true)
        {
          this.mealBooked = 'Meal is booked'; 
        }
        else if(this.isBooked === false)
        {
          this.mealBooked = 'Meal not found';
        }
      }
      else
      {
        for (const date of this.bookedDates$) {
          const formattedDate = this.datePipe.transform(date, 'yyyy-MM-dd');
          if (formattedDate === formatDate) 
          {
            this.isBooked = true;
            //console.log('true');
            break;
          }
          else if(formattedDate != formatDate)
          {
            this.isBooked = false;
            //console.log('false');
          } 
        }
        if(this.isBooked === true)
        {
          this.mealBooked = 'Meal is booked'; 
        }
        else if(this.isBooked === false)
        {
          this.mealBooked = 'Meal not found';
        }
      }
    }
    else
    {
      console.error('error');
    }
    return this.mealBooked;
  }

  isSameDay(date1: Date, date2: Date) {
    return date1.getDate() === date2.getDate() &&
           date1.getMonth() === date2.getMonth() &&
           date1.getFullYear() === date2.getFullYear();
  }

  
}

