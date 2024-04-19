import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AboutComponent } from './about/about.component';
import { TermsComponent } from './terms/terms.component';
import { PrivacyPolicyComponent } from './privacy-policy/privacy-policy.component';
import { LogoutComponent } from './logout/logout.component';
import { ChangePasswordComponent } from './change-password/change-password.component';
import { NotificationComponent } from './notification/notification.component';



@NgModule({
  declarations: [
    AboutComponent,
    TermsComponent,
    PrivacyPolicyComponent,
    LogoutComponent,
    ChangePasswordComponent,
    NotificationComponent
  ],
  imports: [
    CommonModule
  ],
  exports: [
    AboutComponent,
    TermsComponent,
    PrivacyPolicyComponent,
    LogoutComponent,
    ChangePasswordComponent,
    NotificationComponent
  ]
})
export class SideMenuModule { }
