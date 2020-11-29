import 'package:flutter/material.dart' show required;
import 'package:redux/redux.dart' show Store;

import '../service.dart';
import '../models/user.dart';
import '../../../store/state.dart';
import '../../../store/store.dart';

//region Login
class LoginAction {
  LoginAction();
}

class LoginSuccessPayload {
  final User user;

  LoginSuccessPayload({@required this.user});
}

class LoginSuccessAction {
  LoginSuccessPayload payload;

  LoginSuccessAction({@required User user}) {
    payload = LoginSuccessPayload(user: user);
  }
}

class LoginFailAction {}

Future<void> login(
  Store<AppState> store,
  String email,
  String password,
) async {
  store.dispatch(LoginAction());

  try {
    final user = await UserService.signInWithEmailAndPassword(email, password);
    store.dispatch(LoginSuccessAction(user: user));
  } catch (e) {
    store.dispatch(LoginFailAction());
  }
}
//endregion

//region SignUp
class SignUpAction {}

class SignUpSuccessPayload {
  final User user;

  SignUpSuccessPayload({@required this.user});
}

class SignUpSuccessAction {
  SignUpSuccessPayload payload;

  SignUpSuccessAction({@required User user}) {
    this.payload = SignUpSuccessPayload(user: user);
  }
}

class SignUpFailAction {}

Future<void> signUp(
  Store<AppState> store,
  String email,
  String password,
) async {
  store.dispatch(SignUpAction());

  try {
    final user = await UserService.signUpWithEmailAndPassword(email, password);
    store.dispatch(SignUpSuccessAction(user: user));
  } catch (e) {
    store.dispatch(SignUpFailAction());
  }
}
//endregion

//region SignOut
class SignOutAction {}

class SignOutSuccessAction {}

class SignOutFailAction {}

Future<void> signOut() async {
  AppStore.store.dispatch(SignOutAction());
  try {
    await UserService.signOut();
    AppStore.store.dispatch(SignOutSuccessAction());
  } catch (e) {
    AppStore.store.dispatch(SignUpFailAction());
  }
}
//endregion

//region SendPasswordResetEmail
class SendPasswordResetEmailAction {}

class SendPasswordResetEmailSuccessAction {}

class SendPasswordResetEmailFailAction {}
//endregion

//region Update user
class UpdateUserAction {}

class UpdateUserSuccessPayload {
  final User user;

  UpdateUserSuccessPayload(this.user);
}

class UpdateUserSuccessAction {
  UpdateUserSuccessPayload payload;

  UpdateUserSuccessAction({@required User user}) {
    payload = UpdateUserSuccessPayload(user);
  }
}

class UpdateUserFailAction {}
//endregion
