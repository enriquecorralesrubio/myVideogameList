import { Component, OnInit } from '@angular/core';

import { AuthService } from 'src/app/shared/services/auth.service';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';

@Component({
  selector: 'app-admin-header',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './admin-header.component.html',
  styleUrls: ['./admin-header.component.scss']
})
export class AdminHeaderComponent implements OnInit {
  constructor(private authService: AuthService, private router: Router){}
  username: string = "";

  ngOnInit(){
    this.username = this.authService.getUsernameFromToken() || "";
  }

  logout(){
    this.authService.logout();
    this.router.navigateByUrl('/login');
  }


  goToHome(){
    this.router.navigateByUrl("/admin/home");
  }

  navigateToAddForm(){
    this.router.navigate(['admin/add-game']);
  }

  navigateToAddGenre(){
    this.router.navigate(['admin/add-genre']);
  }

  navigateToAddPlatform(){
    this.router.navigate(['admin/add-platform']);
  }
}
