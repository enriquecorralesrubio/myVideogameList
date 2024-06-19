import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { IGameCreate, IGenre, IPlatform } from 'src/app/shared/interfaces/game.interface';

import { AdminHeaderComponent } from 'src/app/shared/components/admin/admin-header/admin-header.component';
import { AuthService } from 'src/app/shared/services/auth.service';
import { CommonModule } from '@angular/common';
import { GameService } from 'src/app/shared/services/game.service';
import { GenreService } from 'src/app/shared/services/genre.service';
import { PlatformService } from 'src/app/shared/services/platform.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { forkJoin } from 'rxjs';

@Component({
  selector: 'app-admin-add-game',
  standalone: true,
  imports: [CommonModule, AdminHeaderComponent, ReactiveFormsModule],
  templateUrl: './admin-add-game.component.html',
  styleUrls: ['./admin-add-game.component.scss']
})
export class AdminAddGameComponent implements OnInit {
  form!: FormGroup;
  genres: IGenre[] = [];
  platforms: IPlatform[] = [];
  isLoading = true;

  constructor(private fb: FormBuilder, private gameService: GameService,
    private router: Router,
    private genreService: GenreService,
    private platformService: PlatformService,
    private authService: AuthService
  ) { }

  ngOnInit(): void {
    const userRole = this.authService.getRoleFromToken();
    if (userRole !== 'ROLE_ADMIN'){
      this.router.navigate(['/access-denied']);
      return;
    }
    this.form = this.fb.group({
      title: ['', [Validators.required, this.noWhitespaceValidator]],
      developer: ['', [Validators.required, this.noWhitespaceValidator]],
      cover: ['', [Validators.required, this.noWhitespaceValidator]],
      synopsis: ['', [Validators.required, this.noWhitespaceValidator]],
      genres: [[], Validators.required],
      platforms: [[], Validators.required]
    });
    //Nos permite combinar ambos observables
    forkJoin({
      genres: this.genreService.getGenres(),
      platforms: this.platformService.getPlatforms()
    }).subscribe({
      next: (result) => {
        this.genres = result.genres;
        this.platforms = result.platforms;
        this.isLoading = false;
      },
      error: (error) => {
        console.error('Error cargando datos', error);
        this.isLoading = false;
      }
    });
  }

  onSubmit(): void {
    if (this.form.valid) {
      const formData: IGameCreate = this.form.getRawValue();
      //const baseUrl = "https://howlongtobeat.com/games/";
      //formData.cover = `${baseUrl}${formData.cover}`;
      this.gameService.addGame(formData).subscribe(response => {
        Swal.fire({
          icon: 'success',
          title: '¡Éxito!',
          text: 'Juego agregado correctamente a la BD',
          confirmButtonText: 'Ir al inicio'
        }).then(() => {
          this.router.navigate(['/admin/home']);
        });
      }, error => {
        Swal.fire({
          icon: 'error',
          title: 'Error',
          text: 'Ha ocurrido un error al agregar el juego',
          confirmButtonText: 'OK'
        });
      });
    } else {
      Object.keys(this.form.controls).forEach(field => {
        const control = this.form.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }


  noWhitespaceValidator(control: FormControl) {
    const value = (control.value || '').trim();
    const isValid = value.length > 0 && value === control.value;
    return isValid ? null : { 'whitespace': true };
  }
}
