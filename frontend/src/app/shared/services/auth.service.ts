import { HttpClient, HttpErrorResponse, HttpHeaders } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';

import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
private endpoint = "http://130.61.160.101:8081/auth"

 //LOCAL
//private endpoint = "http://localhost:8081/auth";

  constructor(private http: HttpClient, private jwtHelper: JwtHelperService) { }

  registerUser(userData: any) :Observable<any> {
    return this.http.post<any>(`${this.endpoint}/register`, userData)
      .pipe(
        catchError(error => {
          let errorMessage = 'Ocurrió un error al procesar la solicitud.';
          if (error.error && error.error.error) {
            errorMessage = error.error.error;
          }
          return throwError(errorMessage);
        })
      );
  }

  login(userData: any): Observable<any> {
    return this.http.post<any>(`${this.endpoint}/login`, userData)
      .pipe(
        catchError(this.handleError)
      );
  }

  logout(): void {
    this.clearToken();
  }


  setToken(token: string): void {
    localStorage.setItem("token", token);
  }

  getToken(): string | null {
    return localStorage.getItem("token");
  }

  getUsernameFromToken(): string | null {
    const token = this.getToken();
    if (token) {
      const decodedToken = this.jwtHelper.decodeToken(token);
      return decodedToken.username;
    } else {
      return null;
    }
  }

  getRoleFromToken(): string | null {
    const token = this.getToken();
    if (token){
      const decodedToken = this.jwtHelper.decodeToken(token);
      return decodedToken.roles[0];
    } else {
      return null;
    }
  }

  isLoggedIn(): boolean {
    return this.getToken() !== null;
  }

  clearToken(): void {
    localStorage.removeItem("token");
  }

  getHeaders(): HttpHeaders {
    const token = this.getToken();
    let headers = new HttpHeaders().set('Content-Type', 'application/json');

    if (token) {
      headers = headers.set('Authorization', `Bearer ${token}`);
    }
    return headers;
  }

  private handleError(error: HttpErrorResponse): Observable<never> {
    let errorMessage = 'Ocurrió un error al procesar la solicitud.';
    if (error.error && error.error.error) {
      errorMessage = error.error.error;
    } else if (error.status === 401) {
      errorMessage = 'Credenciales incorrectas.';
    }
    return throwError(errorMessage);
  }

}




