import { Component, OnInit } from '@angular/core';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-booking',
  templateUrl: './booking.component.html',
  styleUrls: ['./booking.component.css']
})
export class BookingComponent{
  // bookings$: Observable<Booking[]>;

  // constructor(private bookingService: BookingService) {
  //   this.bookings$ = this.bookingService.getBookings();
  //  }
  
  addBooking()
  {
    console.log('Form submitted');
  }
}
