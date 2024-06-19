import { AuthService } from "./auth.service";
import { HttpClient } from "@angular/common/http";
import { IGenre } from "../interfaces/game.interface";
import { Injectable } from "@angular/core";
import { Observable } from 'rxjs';
import { UUID } from "../types/commons.type";

@Injectable({
  providedIn: "root"
})

export class GenreService {
  private readonly endpoint = 'http://130.61.160.101:8081/api';

  constructor(private http: HttpClient, private authService: AuthService) {

  }

  addGenre(genre: string): Observable<any>{
    return this.http.post<IGenre>(`${this.endpoint}/add-genre`,genre,{headers: this.authService.getHeaders()});
  }

  getGenres(): Observable<any> {
    return this.http.get<IGenre>(`${this.endpoint}/genres`, { headers: this.authService.getHeaders() });
  }

  getGenreNames(genres: { uuid: UUID, name: string }[]): string {
    return genres.map(genre => genre.name).join(', ');
  }

  removeGenre(uuid: UUID): Observable<void> {
    return this.http.delete<void>(`${this.endpoint}/delete-genre/${uuid}`, { headers: this.authService.getHeaders() });
  }
}
