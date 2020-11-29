import 'package:MyFood/modules/user/models/address.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

@immutable
class UserState {
  final User user;
  final bool loading;
  final bool updating;

  final bool gettingAddresses;
  final List<Address> addresses;

  get isSignedIn => this.user != null;

  UserState({
    @required this.user,
    @required this.loading,
    @required this.updating,
    @required this.gettingAddresses,
    @required this.addresses,
  });

  factory UserState.initial() => UserState(
        user: null,
        loading: false,
        updating: false,
        addresses: null,
        gettingAddresses: false,
      );

  UserState copyWith({
    User user,
    bool loading,
    bool updating,
    List<Address> addresses,
    bool gettingAddresses,
  }) {
    return UserState(
      user: user ?? this.user,
      loading: loading ?? this.loading,
      updating: updating ?? this.updating,
      addresses: addresses ?? this.addresses,
      gettingAddresses: gettingAddresses ?? this.gettingAddresses,
    );
  }
}
