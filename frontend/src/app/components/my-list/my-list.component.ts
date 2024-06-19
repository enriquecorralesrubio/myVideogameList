import { Component, OnInit } from '@angular/core';

import { AuthService } from 'src/app/shared/services/auth.service';
import { CommonModule } from '@angular/common';
import { FooterComponent } from 'src/app/shared/components/footer/footer.component';
import { FormsModule } from '@angular/forms';
import { GameUserService } from 'src/app/shared/services/game-user.service';
import { HeaderComponent } from 'src/app/shared/components/header/header.component';
import { IGameUser } from 'src/app/shared/interfaces/game-user.interface';
import { NgxPaginationModule } from 'ngx-pagination';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-my-list',
  standalone: true,
  imports: [CommonModule, HeaderComponent, FooterComponent, FormsModule, NgxPaginationModule],
  templateUrl: './my-list.component.html',
  styleUrls: ['./my-list.component.scss']
})
export class MyListComponent implements OnInit {
  games: IGameUser[] = [];
  editData: IGameUser | null = null;
  searchTerm: string = '';
  filteredGames: any[] = [];
  isLoading = true;
  page = 1;

  constructor(private gameUserService: GameUserService,
    private router: Router,
    private authService: AuthService) {}

  ngOnInit(): void {
    const userRole = this.authService.getRoleFromToken();
    if (userRole !== 'ROLE_USER'){
      this.router.navigate(['/login']);
      return;
    }
   this.loadGameList();
  }

  loadGameList(): void {
    this.gameUserService.myGameList().subscribe(
      (data: IGameUser[]) => {

        this.games = data;
        this.filteredGames = this.gameUserService.applyFilter(this.games, this.searchTerm);
        this.isLoading = false;
      },
      (error) => {
        console.error("Error al obtener los datos: ", error);
        this.isLoading = false;
      }
    );
  }

  removeGame(gameUuid: string, gameName:string): void {
    Swal.fire({
      title: '¿Estás seguro?',
      text: `¿Deseas eliminar "${gameName}" de tu lista?`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Sí, eliminar',
      cancelButtonText: 'No, cancelar'
    }).then((result) => {
      if (result.isConfirmed) {
        this.gameUserService.removeGameFromList(gameUuid).subscribe(
          response => {
            Swal.fire({
              title: 'Eliminado',
              text: 'Juego eliminado correctamente de la lista del usuario',
              icon: 'success',
              confirmButtonText: 'OK'
            });
            this.loadGameList();
          },
          error => {
            Swal.fire({
              title: 'Error',
              text: 'Error al eliminar el juego de la lista del usuario',
              icon: 'error',
              confirmButtonText: 'OK'
            });
          }
        );
      }
    });
  }

  openEditForm(listItem: IGameUser) {
    const userUuid = listItem.userUuid;
    const gameUuid = listItem.gameUuid;
    this.router.navigate(['/edit-game', userUuid, gameUuid]);
  }

  sortByOption(event: Event): void {
    const target = event.target as HTMLSelectElement;
    const selectedValue = target.value;
    if (selectedValue === 'name') {
      this.gameUserService.sortByName(this.filteredGames);
    } else if (selectedValue === 'rating') {
      this.gameUserService.sortByRating(this.filteredGames);
    } else if (selectedValue === 'state'){
      this.gameUserService.sortByState(this.filteredGames);
    }
  }


  onSearchChange(): void {
    this.filteredGames= this.gameUserService.applyFilter(this.games, this.searchTerm);
  }
}
