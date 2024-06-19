import { Component, OnInit } from '@angular/core';

import { AuthService } from '../../services/auth.service';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  constructor(private authService: AuthService, private router: Router){}
  username: string = "";
  isMenuOpen: boolean = false;

  ngOnInit(){
    this.username = this.authService.getUsernameFromToken() || "";
  }

  logout(){
    this.authService.logout();
    this.router.navigateByUrl('/login');
  }

  goToMyList(){
    this.router.navigateByUrl("/my-list");
  }

  goToHome(){
    this.router.navigateByUrl("/home");
  }

  toggleMenu() {
    this.isMenuOpen = !this.isMenuOpen;
  }

}
