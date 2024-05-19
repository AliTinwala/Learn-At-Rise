import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatTableModule } from '@angular/material/table';
import { MatFormFieldModule } from '@angular/material/form-field';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from '../app-routing.module';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    BrowserModule,
    FormsModule,
    MatSlideToggleModule,
    MatTableModule,
    MatFormFieldModule,
    HttpClientModule,
  ],
  exports:[
    CommonModule,
    BrowserModule,
    FormsModule,
    MatSlideToggleModule,
    MatTableModule,
    MatFormFieldModule,
    HttpClientModule,
  ]
})
export class SharedModule { 
}

