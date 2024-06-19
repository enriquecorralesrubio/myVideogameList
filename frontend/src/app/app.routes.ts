import { AccesDeniedComponent } from './shared/components/acces-denied/acces-denied.component';
import { AddGameComponent } from './components/add-game/add-game.component';
import { AdminAddGameComponent } from './components/admin/admin-add-game/admin-add-game.component';
import { AdminAddGenreComponent } from './components/admin/admin-add-genre/admin-add-genre.component';
import { AdminAddPlatformComponent } from './components/admin/admin-add-platform/admin-add-platform.component';
import { AdminEditGameComponent } from './components/admin/admin-edit-game/admin-edit-game.component';
import { AdminHomeComponent } from './components/admin/admin-home/admin-home.component';
import { EditGameComponent } from './components/edit-game/edit-game.component';
import { GameDetailsComponent } from './components/game-details/game-details.component';
import { Handle404Component } from './shared/components/handle-404/handle-404.component';
import { HomeComponent } from './components/home/home.component';
import { LoginComponent } from './components/login/login.component';
import { MyListComponent } from './components/my-list/my-list.component';
import { RegisterComponent } from './components/register/register.component';
import { Routes } from '@angular/router';

export const routes: Routes = [
{path: '', redirectTo: '/login', pathMatch: 'full' },
{path:"login", component: LoginComponent},
{path:"register", component: RegisterComponent},
{path:"home", component: HomeComponent},
{path:"my-list", component: MyListComponent},
{path:"admin/home", component: AdminHomeComponent},
{path: 'game-details/:uuid', component: GameDetailsComponent },
{path: 'add-game/:uuid', component: AddGameComponent},
{path: 'edit-game/:userUuid/:gameUuid', component: EditGameComponent},
{path: 'admin/add-game', component: AdminAddGameComponent},
{path: 'admin/add-genre', component: AdminAddGenreComponent},
{path: 'admin/add-platform', component: AdminAddPlatformComponent},
{path: 'admin/edit-game/:uuid', component: AdminEditGameComponent },
{path: 'access-denied', component: AccesDeniedComponent},
{path: '**', component: Handle404Component}
];
