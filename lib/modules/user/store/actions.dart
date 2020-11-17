import 'package:flutter/material.dart' show required;
import 'package:redux/redux.dart' show Store;

import 'action_types.dart';
import '../service.dart';
import '../models/user.dart';
import '../../../store/state.dart';
import '../../../store/store.dart';

//region Login
class LoginAction {
  ActionTypes type = ActionTypes.Login;

  LoginAction();
}

class LoginSuccessPayload {
  final User user;

  LoginSuccessPayload({@required this.user});
}

class LoginSuccessAction {
  ActionTypes type = ActionTypes.Login;
  LoginSuccessPayload payload;

  LoginSuccessAction({@required User user}) {
    payload = LoginSuccessPayload(user: user);
  }
}

class LoginFailAction {
  ActionTypes type = ActionTypes.LoginFail;
}

Future<void> login(
  Store<AppState> store,
  String email,
  String password,
) async {
  store.dispatch(LoginAction());

  try {
    final user = await AuthService.signInWithEmailAndPassword(email, password);
    store.dispatch(LoginSuccessAction(user: user));
  } catch (e) {
    store.dispatch(LoginFailAction());
  }
}
//endregion

//region SignUp
class SignUpAction {
  ActionTypes type = ActionTypes.SingUp;
}

class SignUpSuccessPayload {
  final User user;

  SignUpSuccessPayload({@required this.user});
}

class SignUpSuccessAction {
  ActionTypes type = ActionTypes.SignUpSuccess;
  SignUpSuccessPayload payload;

  SignUpSuccessAction({@required User user}) {
    this.payload = SignUpSuccessPayload(user: user);
  }
}

class SignUpFailAction {
  ActionTypes type = ActionTypes.SignUpFail;
}

Future<void> signUp(
  Store<AppState> store,
  String email,
  String password,
) async {
  store.dispatch(SignUpAction());

  try {
    final user = await AuthService.signUpWithEmailAndPassword(email, password);
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
    await AuthService.signOut();
    AppStore.store.dispatch(SignOutSuccessAction());
  } catch (e) {
    AppStore.store.dispatch(SignUpFailAction());
  }
}
//endregion

//region SendPasswordResetEmail
class SendPasswordResetEmailAction {
  ActionTypes type = ActionTypes.SendPasswordResetEmail;
}

class SendPasswordResetEmailSuccessAction {
  ActionTypes type = ActionTypes.SendPasswordResetEmailSuccess;
}

class SendPasswordResetEmailFailAction {
  ActionTypes type = ActionTypes.SendPasswordResetEmailFail;
}
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
