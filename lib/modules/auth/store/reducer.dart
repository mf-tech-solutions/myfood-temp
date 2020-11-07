import 'package:redux/redux.dart';

import 'actions.dart';
import 'state.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, LoginAction>(_loginStart),
  TypedReducer<AuthState, LoginSuccessAction>(_loginSuccess),
  TypedReducer<AuthState, LoginFailAction>(_loginFail),
  TypedReducer<AuthState, SignUpAction>(_signUpStart),
  TypedReducer<AuthState, SignUpSuccessAction>(_signUpSuccess),
  TypedReducer<AuthState, SignUpFailAction>(_signUpFail),
  TypedReducer<AuthState, SignOutAction>(_signOutStart),
  TypedReducer<AuthState, SignOutSuccessAction>(_signOutSuccess),
  TypedReducer<AuthState, SignOutFailAction>(_signOutFail),
  TypedReducer<AuthState, SendPasswordResetEmailAction>(
      _sendPasswordResetEmailStart),
  TypedReducer<AuthState, SendPasswordResetEmailSuccessAction>(
      _sendPasswordResetEmailSuccess),
  TypedReducer<AuthState, SendPasswordResetEmailFailAction>(
      _sendPasswordResetEmailFail),
]);

//region Login
AuthState _loginStart(AuthState state, LoginAction action) =>
    AuthState.authenticating(user: state.user);

AuthState _loginSuccess(AuthState state, LoginSuccessAction action) =>
    AuthState.authenticated(user: action.payload.user);

AuthState _loginFail(AuthState state, LoginFailAction action) =>
    AuthState.error(user: state.user);
//endregion

//region SignUp
AuthState _signUpStart(AuthState state, SignUpAction action) =>
    AuthState.authenticating(user: state.user);

AuthState _signUpSuccess(AuthState state, SignUpSuccessAction action) =>
    AuthState.authenticated(user: action.payload.user);

AuthState _signUpFail(AuthState state, SignUpFailAction action) =>
    AuthState.error(user: state.user);
//endregion

//region SignOut
AuthState _signOutStart(AuthState state, SignOutAction action) =>
    AuthState.authenticating(user: state.user);

AuthState _signOutSuccess(AuthState state, SignOutSuccessAction action) =>
    AuthState.initial();

AuthState _signOutFail(AuthState state, SignOutFailAction action) =>
    AuthState.authenticated(user: state.user);
//endregion

//region SendPasswordResetEmail
AuthState _sendPasswordResetEmailStart(
  AuthState state,
  SendPasswordResetEmailAction action,
) =>
    AuthState.authenticating(user: state.user);

AuthState _sendPasswordResetEmailSuccess(
        AuthState state, SendPasswordResetEmailSuccessAction action) =>
    AuthState.authenticated(user: state.user);

AuthState _sendPasswordResetEmailFail(
        AuthState state, SendPasswordResetEmailFailAction action) =>
    AuthState.authenticated(user: state.user);
//endregion
