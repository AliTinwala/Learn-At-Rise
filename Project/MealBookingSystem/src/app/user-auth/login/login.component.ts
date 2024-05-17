import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent 
{
  formData = {
    
  };
  constructor(private router: Router) {}

  onLogin()
  {
    console.log('Form submitted');
    this.router.navigateByUrl('calendar');
  }
}

