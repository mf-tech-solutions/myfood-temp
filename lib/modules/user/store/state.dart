import 'package:flutter/material.dart';

import '../models/user.dart';

@immutable
class UserState {
  final User user;
  final bool loading;
  final bool updating;

  get isSignedIn => this.user != null;

  UserState({
    @required this.user,
    @required this.loading,
    @required this.updating,
  });

  factory UserState.initial() => UserState(
        user: null,
        loading: false,
        updating: false,
      );

  UserState copyWith({
    User user,
    bool loading,
    bool updating,
  }) {
    return UserState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
      updating: updating ?? this.updating,
    );
  }
}
