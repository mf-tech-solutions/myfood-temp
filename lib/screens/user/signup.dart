import 'package:flutter/material.dart';

import '../../routes.dart';
import '../../store/store.dart';
import '../../modules/user/resource.dart';
import '../../modules/user/store/actions.dart';
import '../../modules/user/components/signup/signup_screen_body.dart';

class SignUpScreen extends StatefulWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //region Validation
  String validate() {
    String emailValidation = validateEmail(this.widget.emailController.text);
    String passwordValidation =
        validatePassword(this.widget.passwordController.text);
    String message;

    if (emailValidation != null && passwordValidation != null) {
      message = AuthResource.invalidEmailAndPassword;
    } else if (emailValidation != null) {
      message = emailValidation;
    } else if (passwordValidation != null) {
      message = passwordValidation;
    }

    return message;
  }

  String validateEmail(String value) {
    if (value.length == 0) return AuthResource.emailRequired;
    if (!value.contains('@')) return AuthResource.invalidEmail;
    return null;
  }

  String validatePassword(String value) {
    if (value.length == 0) return AuthResource.passwordRequired;

    return null;
  }
  //endregion

  void onSubmit() {
    signUp(
      AppStore.store,
      this.widget.emailController.text,
      this.widget.passwordController.text,
    );

    validate();
    goToHomeScreen();
  }

  void goToHomeScreen() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      homeRoute,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SignUpScreenBody(
          emailController: this.widget.emailController,
          validateEmail: this.validateEmail,
          passwordController: this.widget.passwordController,
          validatePassword: this.validatePassword,
          onSubmit: (_) => this.onSubmit(),
        ),
      ),
    );
  }
}
