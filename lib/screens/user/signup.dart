import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../modules/user/components/signup/signup_screen_body.dart';
import '../../modules/user/resource.dart';
import '../../modules/user/store/actions.dart';
import '../../modules/user/store/state.dart';
import '../../routes.dart';
import '../../store/state.dart';
import '../../store/store.dart';

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
      message = UserResource.invalidEmailAndPassword;
    } else if (emailValidation != null) {
      message = emailValidation;
    } else if (passwordValidation != null) {
      message = passwordValidation;
    }

    return message;
  }

  String validateEmail(String value) {
    if (value.length == 0) return UserResource.emailRequired;
    if (!value.contains('@')) return UserResource.invalidEmail;
    return null;
  }

  String validatePassword(String value) {
    if (value.length == 0) return UserResource.passwordRequired;

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
  }

  void goToHomeScreen() {
    @override
    void run() {
      scheduleMicrotask(() {
        Navigator.of(this.context).pushNamedAndRemoveUntil(
          homeRoute,
          (_) => false,
        );
      });
    }

    run();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserState>(
      converter: (store) => store.state.userState,
      builder: (_, state) {
        if (state.user != null) {
          goToHomeScreen();
        }

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
      },
    );
  }
}
