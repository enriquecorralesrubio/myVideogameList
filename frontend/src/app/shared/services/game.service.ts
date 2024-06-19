import { IGameBase, IGameCreate } from "../interfaces/game.interface";

import { AuthService } from "./auth.service";
import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from 'rxjs';
import { UUID } from "../types/commons.type";

@Injectable({
  providedIn: "root"
})

export class GameService {
  private endpoint = 'http://130.61.160.101:8081/api';
  private adminEndpoint= 'http://130.61.160.101:8081/admin';

  //LOCAL
  //private endpoint = 'http://localhost:8081/api';
  // private adminEndpoint= 'http://localhost:8081/admin';

  constructor(private http: HttpClient, private authService: AuthService) {}

  fetchVideogames(): Observable<IGameBase[]> {
    return this.http.get<IGameBase[]>(`${this.endpoint}/games`, { headers: this.authService.getHeaders() });
}

  getGameDetails(uuid: UUID): Observable<IGameBase> {
    return this.http.get<IGameBase>(`${this.endpoint}/game-detail/${uuid}`, { headers: this.authService.getHeaders() });
  }

  sortByName(games: any[]): void {
    games.sort((a, b) => a.title.localeCompare(b.title));
  }

  sortByRating(games: any[]): void {
    games.sort((a, b) => b.globalRating - a.globalRating);
  }

  sortByDeveloper(games: any[]): void {
    games.sort((a, b) => a.developer.localeCompare(b.developer));
  }

  applyFilter(games: any[], searchTerm: string): any[] {
    return games.filter(game =>
      game.title.toLowerCase().includes(searchTerm.toLowerCase())
    );
  }

  //Métodos del admin

  removeGame(uuid:UUID): Observable<any>{
    return this.http.delete<any>(`${this.adminEndpoint}/game/remove/${uuid}`, { headers: this.authService.getHeaders() });
  }

  addGame(game: IGameCreate): Observable<any>{
    return this.http.post<any>(`${this.adminEndpoint}/game/add`, game, {headers: this.authService.getHeaders()});
  }


  editGame(gameData: any): Observable<any> {
    return this.http.put<any>(`${this.adminEndpoint}/edit-game`, gameData, { headers: this.authService.getHeaders() });
  }
}
