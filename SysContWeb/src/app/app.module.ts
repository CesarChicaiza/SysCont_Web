import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { HttpModule } from '@angular/http';
import { RouterModule } from '@angular/router';
import 'rxjs/add/operator/map'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import {LoginComponent} from './security/login/login.component';
import {MenuComponent} from './navigation/menu/menu.component';
import {ModuleComponent} from './navigation/module/module.component';
import { ContextInitializerComponent } from './navigation/context-initializer/context-initializer.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    ContextInitializerComponent,
    ModuleComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    HttpModule,
    RouterModule,
    NgModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
