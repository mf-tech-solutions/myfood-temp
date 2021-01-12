import 'package:redux/redux.dart';

import 'actions.dart';
import 'state.dart';

final authReducer = combineReducers<UserState>([
  TypedReducer(_loginStart),
  TypedReducer(_loginSuccess),
  TypedReducer(_loginFail),
  TypedReducer(_signUpStart),
  TypedReducer(_signUpSuccess),
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
UserState _loginStart(UserState state, LoginAction action) {
  return state.copyWith(loading: true);
}

UserState _loginSuccess(UserState state, LoginSuccessAction action) {
  return state.copyWith(user: action.payload.user, loading: false);
}

UserState _loginFail(UserState state, LoginFailAction action) {
  return state.copyWith(loading: false, user: null);
}
//endregion

//region SignUp
UserState _signUpStart(UserState state, SignUpAction action) {
  return state.copyWith(loading: true);
}

UserState _signUpSuccess(UserState state, SignUpSuccessAction action) {
  return state.copyWith(user: action.payload.user, loading: false);
}

UserState _signUpFail(UserState state, SignUpFailAction action) {
  return state.copyWith(loading: false);
}
//endregion

//region SignOut
UserState _signOutStart(UserState state, SignOutAction action) {
  return state.copyWith(loading: false);
}

UserState _signOutSuccess(UserState state, SignOutSuccessAction action) {
  return UserState.initial();
}

UserState _signOutFail(UserState state, SignOutFailAction action) {
  return state.copyWith(loading: false);
}
//endregion

//region SendPasswordResetEmail
UserState _sendPasswordResetEmailStart(
  UserState state,
  SendPasswordResetEmailAction action,
) =>
    state.copyWith(loading: true);

UserState _sendPasswordResetEmailSuccess(
  UserState state,
  SendPasswordResetEmailSuccessAction action,
) =>
    state.copyWith(loading: false);

UserState _sendPasswordResetEmailFail(
  UserState state,
  SendPasswordResetEmailFailAction action,
) =>
    state.copyWith(loading: false);
//endregion

UserState _updateUserStart(UserState state, UpdateUserAction action) {
  return state.copyWith(updating: true);
}

UserState _updateUserSuccess(UserState state, UpdateUserSuccessAction action) {
  return state.copyWith(user: action.payload.user, updating: false);
}

UserState _updateUserFail(UserState state, UpdateUserFailAction action) {
  return state.copyWith(updating: false);
}
