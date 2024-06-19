import { AuthService } from '../../services/auth.service';
import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-footer',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent {
  constructor(private router: Router, private authService: AuthService){}
  goToMyList(){
    this.router.navigateByUrl("/my-list");
  }

  goToHome(){
    this.router.navigateByUrl("/home");
  }

  logout(){
    this.authService.logout();
    this.router.navigateByUrl('/login');
  }
}
