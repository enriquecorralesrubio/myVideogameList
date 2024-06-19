import { HttpClientModule, provideHttpClient } from '@angular/common/http'; // Importa HttpClientModule
import { JWT_OPTIONS, JwtHelperService } from '@auth0/angular-jwt';

import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';
import { routes } from './app.routes';

export const appConfig: ApplicationConfig = {
  providers: [
    provideRouter(routes),
    provideHttpClient(),
    HttpClientModule,
    { provide: JWT_OPTIONS, useValue: {} },
    JwtHelperService
  ]
};
