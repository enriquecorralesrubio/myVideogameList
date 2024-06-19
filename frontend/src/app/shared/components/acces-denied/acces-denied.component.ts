import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-acces-denied',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './acces-denied.component.html',
  styleUrls: ['./acces-denied.component.scss']
})
export class AccesDeniedComponent {
  constructor(private router: Router){}
  goToHome(){
    this.router.navigateByUrl("/home");
  }
}
