import { Component } from '@angular/core';

import { ContentService } from './content.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'client';
  collegeName: string = '';
  todayDate: any = null;

  constructor(private contentService: ContentService) {
    this.collegeName = this.contentService.name[0].collegeName;
  }

  ngOnInit() {
    this.todayDate = this.contentService.showDate();
  };
}
