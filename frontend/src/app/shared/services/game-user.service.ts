import { Observable, throwError } from 'rxjs';

import { AuthService } from './auth.service';
import { HttpClient } from '@angular/common/http';
import { IGameUser } from '../interfaces/game-user.interface';
import { Injectable } from '@angular/core';
import { UUID } from '../types/commons.type';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class GameUserService {

  constructor(private http: HttpClient, private authService: AuthService) { }

  private endpoint = "http://130.61.160.101:8081/api/game-user"
  //LOCAL
  //private endpoint = "http://localhost:8081/api/game-user"
myGameList() :Observable<any> {
  return this.http.get<any>(`${this.endpoint}/game-list`, { headers: this.authService.getHeaders() })
  .pipe(
    catchError(error => {
      const errorMessage = error.error || 'Ocurrió un error al procesar la solicitud.';
      return throwError(errorMessage);
    })
  );
}

removeGameFromList(gameUuid: UUID): Observable<any> {
  return this.http.delete<any>(`${this.endpoint}/remove/${gameUuid}`, { headers: this.authService.getHeaders() });
}


addGame(gameData: any): Observable<any> {
  return this.http.post<any>(`${this.endpoint}/add-game`, gameData, { headers: this.authService.getHeaders() });
}

getGameUser(userUuid: UUID, gameUuid: UUID): Observable<IGameUser> {
  return this.http.get<IGameUser>(`${this.endpoint}/getGameUser/${userUuid}/${gameUuid}`);
}

editGame(gameData: any): Observable<any> {
  return this.http.put<any>(`${this.endpoint}/edit-game`, gameData, { headers: this.authService.getHeaders() });
}


isGameInUserList(uuid: UUID): Observable<boolean>{
  return this.http.post<boolean>(`${this.endpoint}/is-game-in-list`, uuid,{ headers: this.authService.getHeaders() } )
}

generateRatings(): number[] {
  return Array.from({ length: 19 }, (_, i) => (i + 2) / 2);
}

sortByName(games: any[]): void {
  games.sort((a, b) => a.gameName.localeCompare(b.gameName));
}

sortByRating(games: any[]): void {
  games.sort((a, b) => b.userRating - a.userRating);
}

sortByState(games: any[]): void {
  games.sort((a, b) => a.state.localeCompare(b.state));
}
applyFilter(games: any[], searchTerm: string): any[] {
  return games.filter(game =>
    game.gameName.toLowerCase().includes(searchTerm.toLowerCase())
  );
}
}

