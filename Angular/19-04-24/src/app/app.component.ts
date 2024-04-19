import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = '19-04-24';
  toggle : boolean = false;
  employees = 
  [
    {
      Id: 1,
      Name: 'Ali',
      Color: 'Blue'
    },
    {
      Id: 2,
      Name: 'Zeenar',
      Color: 'Yellow'
    },
    {
      Id: 3,
      Name: 'Aziza',
      Color: 'Brown'
    }
  ];
  toggleButton() {
    this.toggle = !this.toggle;
  }
}

