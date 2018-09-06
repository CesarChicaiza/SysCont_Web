import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

//import { AuthenticationService } from './authentication.service'
//import { TokenizationService } from './tokenization.service';

declare var toastr;

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  public username: string;
    public password: string;
    public authenticated: boolean;
    public contextSelector: any;
    public context: any;


    constructor(private router: Router) {

        this.authenticated = false;
        this.contextSelector = {};
        this.context = {};
        this.context.membership = {};
        this.context.company = {};

    }

    ngOnInit() {

    }


    public authenticate() {
      this.authenticated = true;
        /*let result = this.authenticationService.validate(this.username, this.password);
        result.subscribe(
            (response) => {

                if (response.success) {

                    console.log(response)

                    this.authenticated = true;
                    this.contextSelector = response.result;
                    this.context.membership = this.contextSelector.user;

                    if (response.result.companies.length == 1) {
                        this.selectCompany(response.result.companies[0]);
                    }
                }
                else {
                    toastr.warning(response.message);
                }
            },
            (error) => {
                toastr.error('Error: ' + error);
            }
        );*/
    }

    public selectCompany() {
      this.router.navigate(['modules']);

        /*this.context.company = company;

        console.log(this.context);

        let result = this.tokenizationService.authenticate(this.context);
        result.subscribe(
            (response) => {
                sessionStorage.setItem('id_token', <string>response.result)
                this.router.navigate(['context-initializer']);
            },
            (error) => {
                toastr.error('Error: ' + error);
            }
        )*/

    }

}
