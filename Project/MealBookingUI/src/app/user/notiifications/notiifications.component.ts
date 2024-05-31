import { Component, OnInit } from '@angular/core';
import { NotificationService } from 'src/app/shared/notification/notification.service';


@Component({
  selector: 'app-notiifications',
  templateUrl: './notiifications.component.html',
  styleUrls: ['./notiifications.component.css']
})
export class NotiificationsComponent implements OnInit{
  constructor(public notificationService: NotificationService) { }
  dataSource: any = [];
  user_id: string = "55EDADED-93BB-4711-79C8-08DC7FD1ED19";
  displayedColumns: string[] = ['Notification Messages'];
  async ngOnInit(): Promise<void> {
    (await this.notificationService.getMessages(this.user_id)).subscribe(data =>
    {
      this.dataSource = data;
    });
  }
}
