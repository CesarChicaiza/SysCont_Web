import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-module',
  templateUrl: './module.component.html',
  styleUrls: ['./module.component.css']
})
export class ModuleComponent implements OnInit {

  //properties
  private sitemaps: any;
  public moduleSitemaps: any;

  //cosntructo
  constructor(private router: Router) { }


  //implementation
  ngOnInit() {

      /*let result = this.moduleService.get();
      result.subscribe(
          (response) => {

              if (response.success)
                  this.moduleSitemaps = response.result;
              else
                 toastr.warning(response.messagge); 

          },
          (error) => {
              toastr.error("Error: " + error)
          }
      );*/
  }

  //methods
  public redirect() {

      
      /*let result = this.sitemapService.get(sitemap.id);
      result.subscribe(
          (response) => {

              if (response.success) {
                  sessionStorage.setItem('sitemap', JSON.stringify(response.result));
                  sessionStorage.setItem('selectedModule', sitemap.name )   ;
                  sessionStorage.setItem("isMenuOpen", "false"); 
                  this.router.navigate([sitemap.homePage]);
              }
          },
          (error) => {
              toastr.error("Error: " + error)
          },
      );*/



  }

  public back(): void {
      window.history.back();
  }

}
