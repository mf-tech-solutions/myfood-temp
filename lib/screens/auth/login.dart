import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../landing.dart';
import '../../routes.dart';
import '../../store/state.dart';
import '../../store/store.dart';
import '../../modules/auth/auth_resource.dart';
import '../../modules/auth/store/state.dart';
import '../../modules/auth/store/actions.dart';
import '../../modules/auth/components/login/login_screen_body.dart';

class LoginScreen extends StatefulWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void goToHomeScreen() {
    @override
    void run() {
      scheduleMicrotask(() {
        Navigator.of(this.context).pushNamedAndRemoveUntil(
          homeRoute,
          (route) => false,
        );
      });
    }

    run();
  }

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

  void onSubmit(BuildContext context) {
    login(
      AppStore.store,
      this.widget.emailController.text,
      this.widget.passwordController.text,
    );

    goToHomeScreen();

    String validation = validate();

    if (validation != null) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.white,
          content: Text(
            validation,
            style: TextStyle(color: Colors.black87),
          ),
          action: SnackBarAction(
            label: 'OK',
            onPressed: () {
              Scaffold.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthState>(
      converter: (store) => store.state.authState,
      builder: (_, state) {
        if (state.loading) {
          return LandingScreen();
        }

        if (state.user != null) {
          goToHomeScreen();
        }

        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: SafeArea(
            child: LoginScreenBody(
              emailController: this.widget.emailController,
              passwordController: this.widget.passwordController,
              validateEmail: this.validateEmail,
              validatePassword: this.validatePassword,
              onSubmit: this.onSubmit,
            ),
          ),
        );
      },
    );
  }
}