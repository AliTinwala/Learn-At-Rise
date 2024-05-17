import { NgModule } from '@angular/core';
import { LoginComponent } from './login/login.component';
import { RegistrationComponent } from './registration/registration.component';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';
import { ChangePasswordComponent } from './change-password/change-password.component';
import { SharedModule } from '../shared/shared.module';



@NgModule({
  declarations: [
    LoginComponent,
    RegistrationComponent,
    ForgotPasswordComponent,
    ChangePasswordComponent,
  ],
  imports: [
    SharedModule
  ],
  exports: [
    LoginComponent,
    RegistrationComponent,
    ForgotPasswordComponent,
    ChangePasswordComponent
  ]
})
export class UserAuthModule { }
