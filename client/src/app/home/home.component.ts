import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['../app.component.css']
})
export class HomeComponent implements OnInit {
  
  students: any[] = [
    {
      name: 'Jerin',
      mark: 40
    },
    {
      name: 'BS',
      mark: 70
    }
  ];

  constructor() { }

  ngOnInit(): void {
  }

}
