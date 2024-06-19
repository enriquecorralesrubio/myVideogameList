import { AuthService } from "./auth.service";
import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from 'rxjs';
import { UUID } from "../types/commons.type";

@Injectable({
  providedIn: "root"
})

export class PlatformService {
  private readonly endpoint = 'http://130.61.160.101:8081/api';

  constructor(private http: HttpClient, private authService: AuthService) {

  }


  addPlatform(platform: string): Observable<any>{
    return this.http.post<any>(`${this.endpoint}/add-platform`,platform,{headers: this.authService.getHeaders()});
  }

  getPlatforms(): Observable<any> {
    return this.http.get<any>(`${this.endpoint}/platforms`, { headers: this.authService.getHeaders() });
  }

  getPlatformNames(platforms: { uuid: UUID, name: string }[]): string {
    return platforms.map(platform => platform.name).join(', ');
  }


  removePlatform(uuid: UUID): Observable<void> {
    return this.http.delete<void>(`${this.endpoint}/delete-platform/${uuid}`, { headers: this.authService.getHeaders() });
  }
}
