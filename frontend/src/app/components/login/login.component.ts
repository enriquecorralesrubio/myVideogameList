import { CommonModule, NgIf } from '@angular/common';
import { Component, OnInit } from '@angular/core';

import { AuthService } from 'src/app/shared/services/auth.service';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { IUserCredentials } from 'src/app/shared/interfaces/user.interface';
import { Router } from '@angular/router';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, HttpClientModule, NgIf, FormsModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  userData: IUserCredentials = {
    username: '',
    password: ''
  };

  errorMessage: string | null = null;
  isLoading = false;
  constructor (private authService: AuthService, private router: Router, private userService: UserService){}
  redirectTo: string | null = null;
  ngOnInit(): void {

  }

  login(event: Event) {
    event.preventDefault();
    this.isLoading = true;
    this.errorMessage = null;

    this.authService.login(this.userData).subscribe(
      (response) => {
        const token = response.token;
        this.authService.setToken(token);

        this.userService.getHomeRedirectUrl().subscribe(
          (response: any) => {
            if (response && response.redirectTo) {
              this.router.navigateByUrl(response.redirectTo);
            } else {
              console.error('La respuesta del servidor no contiene una URL de redirección válida.');
            }
          },
          (error) => {
            console.error('Error al obtener la URL de redirección:', error);
          }
        ).add(() => this.isLoading = false);
      },
      (error) => {
        this.errorMessage = error;
        this.isLoading = false;
      }
    );
  }
}
