import { Component, OnInit } from '@angular/core';

import { AuthService } from '../../services/auth.service';
import { CommonModule } from '@angular/common';
import { Router } from '@angular/router';

@Component({
  selector: 'app-handle-404',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './handle-404.component.html',
  styleUrls: ['./handle-404.component.scss']
})
export class Handle404Component implements OnInit {
  isLoggedIn: boolean = false;

  constructor(private authService: AuthService, private router: Router) {}

  ngOnInit(): void {
    this.isLoggedIn = this.authService.isLoggedIn();
  }

  redirectToLogin() {
    this.router.navigate(['/login']);
  }

  redirectToHome() {
    this.router.navigate(['/home']);
  }
}


