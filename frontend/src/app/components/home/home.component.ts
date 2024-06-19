import { CommonModule, NgFor } from '@angular/common';
import { Component, OnInit } from '@angular/core';

import { AuthService } from 'src/app/shared/services/auth.service';
import { FooterComponent } from 'src/app/shared/components/footer/footer.component';
import { FormsModule } from '@angular/forms';
import { GameService } from 'src/app/shared/services/game.service';
import { GenreService } from 'src/app/shared/services/genre.service';
import { HeaderComponent } from 'src/app/shared/components/header/header.component';
import { IGameBase } from 'src/app/shared/interfaces/game.interface';
import { NgxPaginationModule } from 'ngx-pagination';
import { PlatformService } from 'src/app/shared/services/platform.service';
import { Router } from '@angular/router';
import { UUID } from 'src/app/shared/types/commons.type';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, NgFor,FooterComponent, HeaderComponent, FormsModule, NgxPaginationModule],
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  games: IGameBase[] = [];
  searchTerm: string = '';
  filteredGames: any[] = [];
  isLoading = true;
  page = 1;

  constructor(private gameService:GameService, private router: Router,
    private genreService: GenreService,
    private platformService: PlatformService,
    private authService: AuthService
  ){}


  ngOnInit(): void {
    const userRole = this.authService.getRoleFromToken();
    if (userRole !== 'ROLE_USER'){
      this.router.navigate(['/login']);
      return;
    }
   this.loadGames();
  }

  loadGames(): void {
    this.gameService.fetchVideogames().subscribe(
      (data: IGameBase[]) => {
        this.games = data;
        this.filteredGames = this.gameService.applyFilter(this.games, this.searchTerm);
        this.isLoading = false;
      },
      (error) => {
        console.error('Error cargando juegos:', error);
        this.isLoading = false;
      }
    );

  }

  showGameDetails(uuid: string, event:Event) {
    event.preventDefault();
    this.router.navigate(['/game-details', uuid]);
  }

  sortByOption(event: Event): void {
    const target = event.target as HTMLSelectElement;
    const selectedValue = target.value;
    if (selectedValue === 'name') {
      this.gameService.sortByName(this.filteredGames);
    } else if (selectedValue === 'rating') {
      this.gameService.sortByRating(this.filteredGames);
    } else if (selectedValue === 'developer'){
      this.gameService.sortByDeveloper(this.filteredGames);
    }
  }


  navigateToAddForm(uuid:UUID, event: Event){
    event.preventDefault();
    this.router.navigate(['add-game/', uuid]);
  }

  onSearchChange(): void {
    this.filteredGames= this.gameService.applyFilter(this.games, this.searchTerm);
  }
  getPlatformNames(platforms: { uuid: string, name: string }[]): string {
    return this.platformService.getPlatformNames(platforms);
  }

  getGenreNames(genres: { uuid: string, name: string }[]): string {
    return this.genreService.getGenreNames(genres);
  }
}
