import 'package:redux/redux.dart';

import 'actions.dart';
import 'state.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer(_loginStart),
  TypedReducer(_loginSuccess),
  TypedReducer(_loginFail),
  TypedReducer(_signUpStart),
  TypedReducer<AuthState, SignUpSuccessAction>(_signUpSuccess),
  TypedReducer(_signUpFail),
  TypedReducer(_signOutStart),
  TypedReducer(_signOutSuccess),
  TypedReducer(_signOutFail),
  TypedReducer(_sendPasswordResetEmailStart),
  TypedReducer(_sendPasswordResetEmailSuccess),
  TypedReducer(_sendPasswordResetEmailFail),
  TypedReducer(_updateUserStart),
  TypedReducer(_updateUserSuccess),
  TypedReducer(_updateUserFail),
]);

//region Login
AuthState _loginStart(AuthState state, LoginAction action) {
  return state.copyWith(loading: false);
}

AuthState _loginSuccess(AuthState state, LoginSuccessAction action) {
  return state.copyWith(user: action.payload.user, loading: false);
}

AuthState _loginFail(AuthState state, LoginFailAction action) {
  return state.copyWith(loading: false);
}
//endregion

//region SignUp
AuthState _signUpStart(AuthState state, SignUpAction action) {
  return state.copyWith(loading: false);
}

AuthState _signUpSuccess(AuthState state, SignUpSuccessAction action) {
  return state.copyWith(user: action.payload.user, loading: false);
}

AuthState _signUpFail(AuthState state, SignUpFailAction action) {
  return state.copyWith(loading: false);
}
//endregion

//region SignOut
AuthState _signOutStart(AuthState state, SignOutAction action) {
  return state.copyWith(loading: false);
}

AuthState _signOutSuccess(AuthState state, SignOutSuccessAction action) {
  return AuthState.initial();
}

AuthState _signOutFail(AuthState state, SignOutFailAction action) {
  return state.copyWith(loading: false);
}
//endregion

//region SendPasswordResetEmail
AuthState _sendPasswordResetEmailStart(
  AuthState state,
  SendPasswordResetEmailAction action,
) =>
    state.copyWith(loading: true);

AuthState _sendPasswordResetEmailSuccess(
  AuthState state,
  SendPasswordResetEmailSuccessAction action,
) =>
    state.copyWith(loading: false);

AuthState _sendPasswordResetEmailFail(
  AuthState state,
  SendPasswordResetEmailFailAction action,
) =>
    state.copyWith(loading: false);
//endregion

AuthState _updateUserStart(AuthState state, UpdateUserAction action) {
  return state.copyWith(updating: true);
}

AuthState _updateUserSuccess(AuthState state, UpdateUserSuccessAction action) {
  return state.copyWith(user: action.payload.user, updating: false);
}

AuthState _updateUserFail(AuthState state, UpdateUserFailAction action) {
  return state.copyWith(updating: false);
}
