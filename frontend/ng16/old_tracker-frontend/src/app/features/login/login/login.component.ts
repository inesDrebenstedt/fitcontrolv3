import { Component } from '@angular/core';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent {

  constructor() { }

  onSubmit(form: NgForm) {
    if (form.valid) {
      //const { email, password } = form.value;
      const email = form.value['email'];
      const password = form.value['password'];
      // Handle login logic here
      console.log('Email:', email);
      console.log('Password:', password);
    }
  }
}
