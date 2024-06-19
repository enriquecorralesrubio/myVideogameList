import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';

import { AdminHeaderComponent } from 'src/app/shared/components/admin/admin-header/admin-header.component';
import { AuthService } from 'src/app/shared/services/auth.service';
import { CommonModule } from '@angular/common';
import { GenreService } from 'src/app/shared/services/genre.service';
import { IGenre } from 'src/app/shared/interfaces/game.interface';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { UUID } from 'src/app/shared/types/commons.type';

@Component({
  selector: 'app-admin-add-genre',
  standalone: true,
  imports: [CommonModule, AdminHeaderComponent, ReactiveFormsModule],
  templateUrl: './admin-add-genre.component.html',
  styleUrls: ['./admin-add-genre.component.scss']
})
export class AdminAddGenreComponent implements OnInit{
  form!: FormGroup;
  genres: IGenre[] = [];
  isLoading = true;

  constructor(private fb: FormBuilder, private genreService: GenreService,
    private router: Router,
    private authService : AuthService) {}

    ngOnInit(): void {
      const userRole = this.authService.getRoleFromToken();
      if (userRole !== 'ROLE_ADMIN'){
        this.router.navigate(['/access-denied']);
        return;
      }
      this.getGenres();
      this.form = this.fb.group({
        name: ['', [Validators.required, this.noWhitespaceValidator]]
      });
         }

         onSubmit(): void {
          if (this.form.valid) {
            const formData: string = this.form.getRawValue();

            this.genreService.addGenre(formData).subscribe(response => {
              Swal.fire({
                icon: 'success',
                title: '¡Éxito!',
                text: 'Género agregado correctamente a la BD',
                confirmButtonText: 'Ir al inicio'
              }).then(() => {
                this.getGenres();
                this.router.navigate(['/admin/add-genre']);
              });
            }, error => {
              Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Ha ocurrido un error al agregar el género',
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

        getGenres(): void {
          this.genreService.getGenres().subscribe((data: IGenre[]) => {
            this.genres = data;
            this.isLoading = false;
          });
        }

        removeGenre(uuid: UUID): void {
          Swal.fire({
            title: '¿Estás seguro?',
            text: `¿Deseas eliminar el género de la lista?`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'No, cancelar'
          }).then((result) => {
            if (result.isConfirmed) {
              this.genreService.removeGenre(uuid).subscribe(() => {
                Swal.fire({
                  icon: 'success',
                  title: '¡Éxito!',
                  text: 'Género eliminado correctamente',
                  confirmButtonText: 'OK'
                });
                this.getGenres();
              }, error => {
                Swal.fire({
                  icon: 'error',
                  title: 'Error',
                  text: 'Ha ocurrido un error al eliminar el género',
                  confirmButtonText: 'OK'
                });
              });
            }
          });
        }


        noWhitespaceValidator(control: FormControl) {
          const value = (control.value || '').trim();
          const isValid = value.length > 0 && value === control.value;
          return isValid ? null : { 'whitespace': true };
        }
      }
