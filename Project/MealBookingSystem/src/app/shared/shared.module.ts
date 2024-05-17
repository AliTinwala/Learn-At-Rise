import { NgModule } from '@angular/core';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { AppRoutingModule } from '../app-routing.module';
import { CommonModule } from '@angular/common';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
 
@NgModule({
  declarations: [
    HeaderComponent,
    FooterComponent
  ],
  imports: 
  [
    AppRoutingModule,
    CommonModule,
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ]
    ,
  exports: [
    HeaderComponent,
    FooterComponent,
    AppRoutingModule
  ]
})
export class SharedModule { }
