import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';

import { AdminHeaderComponent } from 'src/app/shared/components/admin/admin-header/admin-header.component';
import { AuthService } from 'src/app/shared/services/auth.service';
import { CommonModule } from '@angular/common';
import { IPlatform } from 'src/app/shared/interfaces/game.interface';
import { PlatformService } from 'src/app/shared/services/platform.service';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { UUID } from 'src/app/shared/types/commons.type';

@Component({
  selector: 'app-admin-add-platform',
  standalone: true,
  imports: [CommonModule, AdminHeaderComponent, ReactiveFormsModule],
  templateUrl: './admin-add-platform.component.html',
  styleUrls: ['./admin-add-platform.component.scss']
})
export class AdminAddPlatformComponent implements OnInit{
  form!: FormGroup;
  platforms: IPlatform[] = [];
  isLoading = true;

  constructor(private fb: FormBuilder, private platformService: PlatformService,
    private router: Router,
    private authService : AuthService) {}

    ngOnInit(): void {
      const userRole = this.authService.getRoleFromToken();
      if (userRole !== 'ROLE_ADMIN'){
        this.router.navigate(['/access-denied']);
        return;
      }
      this.getPlatforms();
      this.form = this.fb.group({
        name: ['', [Validators.required, , this.noWhitespaceValidator]]
      });
         }

         getPlatforms(): void {
          this.platformService.getPlatforms().subscribe((data: IPlatform[]) => {
            this.platforms = data;
            this.isLoading = false;
          });
        }

         onSubmit(): void {
          if (this.form.valid) {
            const formData: string = this.form.getRawValue();

            this.platformService.addPlatform(formData).subscribe(response => {
              Swal.fire({
                icon: 'success',
                title: '¡Éxito!',
                text: 'Plataforma agregada correctamente a la BD',
                confirmButtonText: 'Ir al inicio'
              }).then(() => {
                this.getPlatforms();
                this.router.navigate(['/admin/add-platform']);
              });
            }, error => {
              Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Ha ocurrido un error al agregar la plataforma',
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

        removePlatform(uuid: UUID): void {
          Swal.fire({
            title: '¿Estás seguro?',
            text: `¿Deseas eliminar la plataforma de la lista?`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'No, cancelar'
          }).then((result) => {
            if (result.isConfirmed) {
              this.platformService.removePlatform(uuid).subscribe(() => {
                Swal.fire({
                  icon: 'success',
                  title: '¡Éxito!',
                  text: 'Plataforma eliminada correctamente',
                  confirmButtonText: 'OK'
                });
                this.getPlatforms();
              }, error => {
                Swal.fire({
                  icon: 'error',
                  title: 'Error',
                  text: 'Ha ocurrido un error al eliminar la plataforma',
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

