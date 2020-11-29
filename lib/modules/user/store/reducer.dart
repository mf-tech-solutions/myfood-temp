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
  TypedReducer(_getUserAddressesStart),
  TypedReducer(_getUserAddressesSuccess),
  TypedReducer(_getUserAddressesFail),
  TypedReducer(_addUserAddressStart),
  TypedReducer(_addUserAddressSuccess),
  TypedReducer(_addUserAddressFail),
  TypedReducer(_setDefaultUserAddress),
  TypedReducer(_setDefaultUserAddressSuccess),
  TypedReducer(_setDefaultUserAddressFail),
]);

//region Login
UserState _loginStart(UserState state, LoginAction action) {
  return state.copyWith(loading: false);
}

UserState _loginSuccess(UserState state, LoginSuccessAction action) {
  return state.copyWith(user: action.payload.user, loading: false);
}

UserState _loginFail(UserState state, LoginFailAction action) {
  return state.copyWith(loading: false);
}
//endregion

//region SignUp
UserState _signUpStart(UserState state, SignUpAction action) {
  return state.copyWith(loading: false);
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

UserState _getUserAddressesStart(
  UserState state,
  GetUserAddressessAction action,
) {
  return state.copyWith(loadingAddresses: true);
}

UserState _getUserAddressesSuccess(
  UserState state,
  GetUserAddressessSuccessAction action,
) {
  return state.copyWith(
    loadingAddresses: false,
    addresses: action.payload.addresses,
  );
}

UserState _getUserAddressesFail(
  UserState state,
  GetUserAddressessFailAction action,
) {
  return state.copyWith(loadingAddresses: false);
}

UserState _addUserAddressStart(UserState state, AddUserAddressAction action) {
  return state.copyWith(loadingAddresses: true);
}

UserState _addUserAddressSuccess(
  UserState state,
  AddUserAddressSuccessAction action,
) {
  final addresses = [...state.addresses, action.payload.address];

  return state.copyWith(
    loadingAddresses: false,
    addresses: addresses,
  );
}

UserState _addUserAddressFail(
  UserState state,
  AddUserAddressFailAction action,
) {
  return state.copyWith(loadingAddresses: false);
}

UserState _setDefaultUserAddress(
  UserState state,
  SetDefaultUserAddressAction action,
) {
  final newDefaultAddress = action.payload.address.copyWith(isDefault: true);
  final addresses = state.addresses.map(
    (e) {
      return e.addressId == newDefaultAddress.addressId
          ? newDefaultAddress
          : e.copyWith(isDefault: false);
    },
  ).toList();

  return state.copyWith(addresses: addresses);
}

UserState _setDefaultUserAddressSuccess(
  UserState state,
  SetDefaultUserAddressSuccessAction action,
) {
  return state;
}

UserState _setDefaultUserAddressFail(
  UserState state,
  SetDefaultUserAddressFailAction action,
) {
  final previousDefaultAddress = action.payload.previousAddress;
  final addresses = state.addresses.map(
    (e) {
      return e.addressId == previousDefaultAddress.addressId
          ? previousDefaultAddress.addressId
          : e.copyWith(isDefault: false);
    },
  ).toList();

  return state.copyWith(addresses: addresses);
}
