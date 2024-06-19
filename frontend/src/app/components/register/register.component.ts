import { CommonModule, NgIf } from '@angular/common';

import { AuthService } from '../../shared/services/auth.service';
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { IUserRegistrationData } from 'src/app/shared/interfaces/user.interface';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  standalone: true,
  imports: [CommonModule, HttpClientModule, NgIf, FormsModule],
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent {
  registrationData: IUserRegistrationData = {
    username: '',
    password: '',
    email: ''
  };

  errorMessage: string | null = null;
  isLoading = false;

  constructor(private authService: AuthService, private router: Router) {}

  registerUser(event : Event) {
    event.preventDefault();
    this.isLoading = true;
    this.authService.registerUser(this.registrationData)
    .subscribe(
      (response) => {
        const token = response.token;
        this.authService.setToken(token);

        this.router.navigateByUrl('/home');

      },
      error => {
        this.errorMessage = error;
      }
    )
    .add(() => this.isLoading = false);
  }
}

