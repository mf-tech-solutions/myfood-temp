import 'package:flutter/material.dart';
import '../models/user.dart';

@immutable
class AuthState {
  final User user;
  final bool loading;

  get isSignedIn => this.user != null;

  AuthState({
    @required this.user,
    @required this.loading,
  });

  factory AuthState.initial() => AuthState(user: null, loading: false);

  factory AuthState.authenticating({@required User user}) =>
      AuthState(user: user, loading: true);

  factory AuthState.authenticated({@required User user}) =>
      AuthState(user: user, loading: false);

  factory AuthState.error({@required User user}) =>
      AuthState(user: user, loading: false);

  AuthState copyWith({
    User user,
    bool loading,
  }) {
    return AuthState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
    );
  }
}
