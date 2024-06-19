import { ActivatedRoute, Router } from '@angular/router';
import { CommonModule, NgFor } from '@angular/common';
import { Component, OnInit } from '@angular/core';

import { AuthService } from 'src/app/shared/services/auth.service';
import { FooterComponent } from 'src/app/shared/components/footer/footer.component';
import { GameService } from 'src/app/shared/services/game.service';
import { GenreService } from 'src/app/shared/services/genre.service';
import { HeaderComponent } from 'src/app/shared/components/header/header.component';
import { IGameBase } from 'src/app/shared/interfaces/game.interface';
import { PlatformService } from 'src/app/shared/services/platform.service';
import { UUID } from 'src/app/shared/types/commons.type';

@Component({
  selector: 'app-game-details',
  standalone: true,
  imports: [CommonModule, NgFor,FooterComponent, HeaderComponent],
  templateUrl: './game-details.component.html',
  styleUrls: ['./game-details.component.scss']
})
export class GameDetailsComponent implements OnInit{

    gameUuid: UUID | null = "";
    gameDetails: IGameBase | null = null;
    isLoading = true;

    constructor(private route: ActivatedRoute,
      private gameService: GameService,
      private genreService: GenreService,
      private platfomService: PlatformService,
      private authService: AuthService,
      private router: Router) { }

    ngOnInit(): void {
      const userRole = this.authService.getRoleFromToken();
      if (userRole !== 'ROLE_USER'){
        this.router.navigate(['/login']);
        return;
      }
      this.gameUuid = this.route.snapshot.paramMap.get('uuid');
      this.loadGameDetails(this.gameUuid);
    }

    loadGameDetails(uuid: string | null) {
      if (uuid) {
        this.gameService.getGameDetails(uuid)
          .subscribe(
            (response) => {
              this.gameDetails = response;
              this.isLoading = false;
            },
            (error) => {
              console.error('Error al cargar los detalles del juego:', error);
              this.isLoading = false;
            }
          );
      }
    }

    getPlatformNames(platforms: { uuid: string, name: string }[]): string {
      return this.platfomService.getPlatformNames(platforms);
    }

    getGenreNames(genres: { uuid: string, name: string }[]): string {
      return this.genreService.getGenreNames(genres);
    }
  }
