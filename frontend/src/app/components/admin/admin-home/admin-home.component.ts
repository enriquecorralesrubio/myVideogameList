import { Component, OnInit } from '@angular/core';

import { AdminHeaderComponent } from 'src/app/shared/components/admin/admin-header/admin-header.component';
import { AuthService } from 'src/app/shared/services/auth.service';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { GameService } from 'src/app/shared/services/game.service';
import { GenreService } from 'src/app/shared/services/genre.service';
import { IGameBase } from 'src/app/shared/interfaces/game.interface';
import { NgxPaginationModule } from 'ngx-pagination';
import { PlatformService } from 'src/app/shared/services/platform.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { UUID } from 'src/app/shared/types/commons.type';

@Component({
  selector: 'app-admin-home',
  standalone: true,
  imports: [CommonModule, FormsModule, AdminHeaderComponent, NgxPaginationModule],
  templateUrl: './admin-home.component.html',
  styleUrls: ['./admin-home.component.scss']
})
export class AdminHomeComponent implements OnInit {
  constructor(private gameService:GameService, private router: Router,
    private genreService: GenreService,
    private platformService: PlatformService,
    private authService: AuthService
  ){}
  games: IGameBase[] = [];
  searchTerm: string = '';
  filteredGames: any[] = [];
  isLoading = true;
  page = 1;

  ngOnInit(): void {
    const userRole = this.authService.getRoleFromToken();
    if (userRole !== 'ROLE_ADMIN'){
      this.router.navigate(['/access-denied']);
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

  removeGame(uuid:UUID, title:string):void{
    Swal.fire({
      title: '¿Estás seguro?',
      text: `¿Deseas eliminar "${title}" de la base de datos?`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Sí, eliminar',
      cancelButtonText: 'No, cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        this.gameService.removeGame(uuid).subscribe(
          response => {
            Swal.fire({
              title: 'Eliminado',
              text: 'Juego eliminado correctamente de la base de datos',
              icon: 'success',
              confirmButtonText: 'OK'
            });
            this.loadGames();
          },
          error => {
            Swal.fire({
              title: 'Error',
              text: 'Error al eliminar el juego de la base de datos',
              icon: 'error',
              confirmButtonText: 'OK'
            });
          }
        );
      }
    });
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

  navigateToEditForm(uuid: UUID, event: Event){
    event.preventDefault();
    this.router.navigate(['admin/edit-game/', uuid]);
  }

  onSearchChange(): void {
    this.filteredGames= this.gameService.applyFilter(this.games, this.searchTerm);
  }

  getPlatformNames(platforms: { uuid: UUID, name: string }[]): string {
    return this.platformService.getPlatformNames(platforms);
  }

  getGenreNames(genres: { uuid: UUID, name: string }[]): string {
    return this.genreService.getGenreNames(genres);
  }
}
