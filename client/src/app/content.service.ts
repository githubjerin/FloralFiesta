import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ContentService {

  constructor() { }

  name = [
    {collegeName: 'Rajalakshmi Engineering College'}
  ];

  showDate() {
    let date = new Date();
    return date;
  }
}
