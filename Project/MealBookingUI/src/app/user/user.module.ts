import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NotiificationsComponent } from './notiifications/notiifications.component';
import { SharedModule } from '../shared/shared.module';



@NgModule({
  declarations: [
    NotiificationsComponent
  ],
  imports: [
    CommonModule,
    SharedModule
  ]
})
export class UserModule { }
