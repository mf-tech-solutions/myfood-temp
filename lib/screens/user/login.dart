import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../modules/user/components/login/login_screen_body.dart';
import '../../modules/user/resource.dart';
import '../../modules/user/store/action_creators.dart';
import '../../modules/user/store/state.dart';
import '../../routes.dart';
import '../../store/state.dart';

class LoginScreen extends StatefulWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void goToHomeScreen() {
    Navigator.of(this.context).pushReplacementNamed(
      homeRoute,
    );
  }

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

  void onSubmit(BuildContext context) async {
    await login(
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
    return StoreConnector<AppState, UserState>(
      converter: (store) => store.state.userState,
      builder: (_, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: LoginScreenBody(
            emailController: this.widget.emailController,
            passwordController: this.widget.passwordController,
            validateEmail: this.validateEmail,
            validatePassword: this.validatePassword,
            onSubmit: this.onSubmit,
          ),
          key: _scaffoldKey,
        );
      },
    );
  }
}
