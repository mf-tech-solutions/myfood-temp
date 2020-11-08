import 'package:flutter/material.dart';

import '../models/user.dart';

@immutable
class AuthState {
  final User user;
  final bool loading;
  final bool updating;

  get isSignedIn => this.user != null;

  AuthState({
    @required this.user,
    @required this.loading,
    @required this.updating,
  });

  factory AuthState.initial() => AuthState(
        user: null,
        loading: false,
        updating: false,
      );

  AuthState copyWith({
    User user,
    bool loading,
    bool updating,
  }) {
    return AuthState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
      updating: updating ?? this.updating,
    );
  }
}
