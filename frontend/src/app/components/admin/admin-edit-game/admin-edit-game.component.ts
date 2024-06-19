import { ActivatedRoute, Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { IGameBase, IGameCreate, IGenre, IPlatform } from 'src/app/shared/interfaces/game.interface';

import { AdminHeaderComponent } from 'src/app/shared/components/admin/admin-header/admin-header.component';
import { AuthService } from 'src/app/shared/services/auth.service';
import { CommonModule } from '@angular/common';
import { GameService } from 'src/app/shared/services/game.service';
import { GenreService } from 'src/app/shared/services/genre.service';
import { PlatformService } from 'src/app/shared/services/platform.service';
import Swal from 'sweetalert2';
import { UUID } from 'src/app/shared/types/commons.type';

@Component({
  selector: 'app-admin-edit-game',
  standalone: true,
  imports: [CommonModule, AdminHeaderComponent, ReactiveFormsModule],
  templateUrl: './admin-edit-game.component.html',
  styleUrls: ['./admin-edit-game.component.scss']
})
export class AdminEditGameComponent implements OnInit {
  form!: FormGroup;
  uuid: UUID | null = "";
  editData: IGameBase | null = null;
  errorMessage: string = "";
  genres: IGenre[] = [];
  platforms: IPlatform[] = [];
  errors: string[] = [];
  isLoading = false;
  isLoadingForm = true;

  constructor(
    private fb: FormBuilder,
    private gameService: GameService,
    private router: Router,
    private route: ActivatedRoute,
    private genreService: GenreService,
    private platformService: PlatformService,
    private authService : AuthService
  ) {
    this.form = this.fb.group({
      title: ['', [Validators.required, this.noWhitespaceValidator]],
      developer: ['', [Validators.required, this.noWhitespaceValidator]],
      cover: ['', [Validators.required, this.noWhitespaceValidator]],
      synopsis: ['', [Validators.required, this.noWhitespaceValidator]],
      genres: [[], Validators.required],
      platforms: [[], Validators.required]
    });
    this.genreService.getGenres().subscribe((data: IGenre[]) => {
      this.genres = data;
    });

    this.platformService.getPlatforms().subscribe((data: IPlatform[]) => {
      this.platforms = data;
    });
  }

  ngOnInit(): void {
    const userRole = this.authService.getRoleFromToken();
    if (userRole !== 'ROLE_ADMIN'){
      this.router.navigate(['/access-denied']);
      return;
    }
    this.uuid = this.route.snapshot.paramMap.get('uuid');
    if (this.uuid) {
      this.loadGameData(this.uuid);
    }

  }

  loadGameData(uuid: UUID): void {
    this.gameService.getGameDetails(uuid).subscribe(
      (data: IGameBase) => {
        this.editData = data;
        this.initFormData();
        this.isLoadingForm = false;

      },
      (error) => {
        if (error.status === 404) {
          this.errorMessage = 'No se pudo encontrar el juego.';
        } else {
          this.errorMessage = 'Se produjo un error al cargar los datos del juego. Por favor, inténtalo de nuevo más tarde.';
        }
      }
    );
  }

  initFormData(): void {
    if (this.editData) {
      this.form.patchValue({
        title: this.editData.title || '',
        developer: this.editData.developer || '',
        cover: this.editData.cover || '',
        synopsis: this.editData.synopsis || '',
        genres: this.editData.genres.map(genre => genre.uuid),
        platforms: this.editData.platforms.map(platform => platform.uuid)
      });
    }
  }

  noWhitespaceValidator(control: FormControl) {
    const value = (control.value || '').trim();
    const isValid = value.length > 0 && value === control.value;
    return isValid ? null : { 'whitespace': true };
  }

  submitEdit(): void {
    this.isLoading = true;
    if (this.form.valid) {
      const formData: IGameCreate = this.form.getRawValue();
      //const baseUrl = "https://howlongtobeat.com/games/";
      //formData.cover = `${baseUrl}${formData.cover}`;
      this.gameService.editGame({
        ...this.editData,
        ...formData,
      }).subscribe(response => {
        this.isLoading = false;
        Swal.fire({
          icon: 'success',
          title: '¡Éxito!',
          text: 'Juego editado correctamente',
          confirmButtonText: 'Ir al inicio'
        }).then(() => {
          this.router.navigate(['/admin/home']);
        });
      }, error => {
        this.isLoading = false;
        this.errors = error.error.errors || ['Ha ocurrido un error al agregar el juego'];
        Swal.fire({
          icon: 'error',
          title: 'Error',
          text: this.errors.join('\n'),
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

  cancelEdit() {
    this.router.navigate(['/admin/home']);
  }
}
