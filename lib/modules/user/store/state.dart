import 'package:flutter/material.dart';

import '../models/address.dart';
import '../models/user.dart';

@immutable
class UserState {
  final User user;
  final bool loading;
  final bool updating;

  final bool loadingAddresses;
  final List<Address> addresses;

  get isSignedIn => this.user != null;

  UserState({
    @required this.user,
    @required this.loading,
    @required this.updating,
    @required this.loadingAddresses,
    @required this.addresses,
  });

  factory UserState.initial() => UserState(
        user: null,
        loading: false,
        updating: false,
        addresses: null,
        loadingAddresses: false,
      );

  UserState copyWith({
    User user,
    bool loading,
    bool updating,
    List<Address> addresses,
    bool loadingAddresses,
  }) {
    return UserState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
      updating: updating ?? this.updating,
      addresses: addresses ?? this.addresses,
      loadingAddresses: loadingAddresses ?? this.loadingAddresses,
    );
  }
}
