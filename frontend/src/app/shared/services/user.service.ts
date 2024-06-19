import { AuthService } from './auth.service';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  private readonly endpoint= 'http://130.61.160.101:8081/api/user/index';

  //LOCAL
  //private readonly endpoint = 'http://localhost:8081/api/user/index';

  constructor(private http: HttpClient, private authService: AuthService) { }


getHomeRedirectUrl(): Observable<string> {
  const headers = this.authService.getHeaders();
  return this.http.get<string>(this.endpoint, {headers});
}
}
