import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = '19-04-24';
  toggle : boolean = false;
  toggleButton() {
    this.toggle = !this.toggle;
  }
}

