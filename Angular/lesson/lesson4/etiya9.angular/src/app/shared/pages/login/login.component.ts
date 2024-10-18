import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormControl,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [FormsModule, ReactiveFormsModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss',
})
export class LoginComponent implements OnInit {
  form!: FormGroup;
  // Reactive Forms
  constructor(private formBuilder: FormBuilder, private router: Router) {}
  ngOnInit(): void {
    this.buildForm();
  }

  buildForm() {
    this.form = this.formBuilder.group({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [
        Validators.required,
        Validators.minLength(3),
      ]),
    });
  }

  submitForm() {
    this.form.markAllAsTouched();
    if (!this.form.valid) {
      return;
    }
    // http isteği
    console.log(this.form.value);
    this.router.navigateByUrl('/');
  }

  hasError(controlName: string) {
    return (
      !this.form.get(controlName)?.valid && this.form.get(controlName)?.touched
    );
  }
  get isFormValid() {
    return this.form.valid;
  }
}
