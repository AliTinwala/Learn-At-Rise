import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
  { path:'static', loadChildren: () => import('./static/static.module').then(m => m.StaticModule)},
  { path:'home', loadChildren: () => import('./home/home.module').then(m => m.HomeModule)},
  { path:'', loadChildren: () => import('./home/home.module').then(m => m.HomeModule)},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
