import { ActivatedRoute, Router } from '@angular/router';
import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';

import { AuthService } from 'src/app/shared/services/auth.service';
import { CommonModule } from '@angular/common';
import { FooterComponent } from 'src/app/shared/components/footer/footer.component';
import { GameService } from 'src/app/shared/services/game.service';
import { GameUserService } from 'src/app/shared/services/game-user.service';
import { HeaderComponent } from 'src/app/shared/components/header/header.component';
import Swal from 'sweetalert2';
import { UUID } from 'src/app/shared/types/commons.type';

@Component({
  selector: 'app-add-game',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, HeaderComponent, FooterComponent],
  templateUrl: './add-game.component.html',
  styleUrls: ['./add-game.component.scss']
})
export class AddGameComponent implements OnInit {


    form!: FormGroup;
    ratings: number[] = [];

    cover:string = "";
    title:string = "";
    uuid: UUID = "";
    errors: string[] = [];
    isLoading = false;
    isLoadingForm = true;

    constructor(
      private route: ActivatedRoute,
      private gameService: GameService,
      private fb: FormBuilder,
      private gameUserService : GameUserService,
      private router: Router,
      private authService: AuthService
    ) {}

    ngOnInit(): void {
      const userRole = this.authService.getRoleFromToken();
      if (userRole !== 'ROLE_USER'){
        this.router.navigate(['/login']);
        return;
      }
      this.form = this.fb.group({
        userRating: [-1, [Validators.min(-1), Validators.max(10)]],
        timePlayed: [0, Validators.min(0)],
        state: ['pendiente', Validators.required]
      });

      this.uuid = this.route.snapshot.paramMap.get('uuid')!;
      this.gameService.getGameDetails(this.uuid).subscribe(game => {
        this.title = game.title;
        this.cover = game.cover;
        this.isLoadingForm = false;
      });
      this.ratings = this.gameUserService.generateRatings();

    }

    onSubmit(): void {
      this.isLoading = true;
      if (this.form.valid) {
        const formData = this.form.getRawValue();

        this.gameUserService.addGame({
          ...formData,
          uuid: this.uuid,
          title: this.title,
          cover: this.cover
        }).subscribe(response => {
          this.isLoading = false;
          Swal.fire({
            icon: 'success',
            title: '¡Éxito!',
            text: 'Juego agregado correctamente',
            confirmButtonText: 'Ir al inicio'
          }).then(() => {
            this.router.navigate(['/home']);
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


}
