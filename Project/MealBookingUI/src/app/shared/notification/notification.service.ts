import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError } from 'rxjs';
import { Notiification } from './notification.model';

@Injectable({
  providedIn: 'root'
})
export class NotificationService {

  constructor(private myHttp:HttpClient) { } 

  notificationUrl = "https://localhost:7108/api/Notification";
  notificationList:Notification[] = [];
  //notificationData:Notification = new Notiification();

  getMessages(user_id: string): Observable<string[]>
  {
    return this.myHttp.get<string[]>(`${this.notificationUrl}`);
  }
}
