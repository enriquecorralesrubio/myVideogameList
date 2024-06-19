import { ActivatedRoute, Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';

import { AuthService } from 'src/app/shared/services/auth.service';
import { CommonModule } from '@angular/common';
import { FooterComponent } from 'src/app/shared/components/footer/footer.component';
import { GameUserService } from 'src/app/shared/services/game-user.service';
import { HeaderComponent } from 'src/app/shared/components/header/header.component';
import { IGameUser } from 'src/app/shared/interfaces/game-user.interface';
import Swal from 'sweetalert2';
import { UUID } from 'src/app/shared/types/commons.type';

@Component({
  selector: 'app-edit-game',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, HeaderComponent, FooterComponent],
  templateUrl: './edit-game.component.html',
  styleUrls: ['./edit-game.component.scss']
})
export class EditGameComponent implements OnInit {
  form: FormGroup;
  ratings: number[] = [];
  editData: IGameUser | null = null;
  userUuid: UUID | null = "";
  gameUuid: UUID | null = "";
  errorMessage: string = "";
  errors: string[] = [];
  isLoading = false;
  isLoadingForm = true;
  constructor(
    private fb: FormBuilder,
    private gameUserService: GameUserService,
    private router: Router,
    private route: ActivatedRoute,
    private authService: AuthService
  ) {
    this.form = this.fb.group({
      userRating: [-1, [Validators.min(-1), Validators.max(10)]],
      timePlayed: ['', Validators.min(0)],
      state: ['pending', Validators.required]
    });
  }

  ngOnInit(): void {
    const userRole = this.authService.getRoleFromToken();
    if (userRole !== 'ROLE_USER'){
      this.router.navigate(['/login']);
      return;
    }
    this.userUuid = this.route.snapshot.paramMap.get('userUuid');
    this.gameUuid = this.route.snapshot.paramMap.get('gameUuid');
    if (this.userUuid && this.gameUuid) {
      this.loadGameUserData(this.userUuid, this.gameUuid);
    }
    this.ratings = this.gameUserService.generateRatings();
  }

  loadGameUserData(userUuid: UUID, gameUuid: UUID): void {
    this.gameUserService.getGameUser(userUuid, gameUuid).subscribe(data => {
      this.editData = data;
      this.form.patchValue({
        userRating: data.userRating,
        timePlayed: data.timePlayed,
        state: data.state
      });
      this.isLoadingForm = false;
    }, error => {
      if (error.status === 404) {
        this.errorMessage = 'No se pudo encontrar la relación usuario-juego.';
      } else {
        this.errorMessage = 'Se produjo un error al cargar los datos del juego o del usuario. Por favor, inténtalo de nuevo más tarde.';
      }
      this.isLoadingForm = false;
    });
  }

  cancelEdit() {
    this.router.navigate(['/my-list']);
  }

  submitEdit(): void {
    this.isLoading = true;
    if (this.form.valid) {
      const formData = this.form.getRawValue();

      this.gameUserService.editGame({
        ...this.editData,
        ...formData,
      }).subscribe(response => {
        this.isLoading = false;
        Swal.fire({
          icon: 'success',
          title: '¡Éxito!',
          text: 'Juego editado correctamente',
          confirmButtonText: 'Ir a tu lista'
        }).then(() => {
          this.router.navigate(['/my-list']);

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
      //Array de las propiedades del objeto
      Object.keys(this.form.controls).forEach(field => {
        const control = this.form.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }
}

