import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
//Security
import { LoginComponent } from './security/login/login.component';
import { ModuleComponent } from './navigation/module/module.component';



const routes: Routes = [
  {
    path: '',
    component: LoginComponent
  },
  {
    path: '\login',
    component: LoginComponent
  },
  {
    path: '\modules',
    component: ModuleComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
