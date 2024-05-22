import { HttpClient} from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Booking } from './booking.model';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BookingService {

  constructor(private myHttp:HttpClient) { }
  bookingUrl:string = "https://localhost:7108/api/Booking";
  bookingList:Booking[]=[];
  bookingData:Booking = new Booking();

  saveBooking()
  {
    return this.myHttp.post(this.bookingUrl,this.bookingData);
  }
  updateBooking()
  {
    return this.myHttp.put(`${this.bookingUrl}/${this.bookingData.id}`,this.bookingData);
  }
  getBookings(): Observable<Booking[]>
  {
    return this.myHttp.get<Booking[]>(this.bookingUrl);
  }
  deleteBooking(Id:number)
  {
    return this.myHttp.delete(`${this.bookingUrl}/${Id}`);
  }
  getBookingExists(date: string): Observable<boolean>
  {
    return this.myHttp.get<boolean>(`${this.bookingUrl}/exists/${date}`);
  }
}
