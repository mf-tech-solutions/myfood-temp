import 'package:flutter/material.dart' show immutable, required;

import '../modules/cart/store/state.dart';
import '../modules/food/store/state.dart';
import '../modules/navigation/store/state.dart';
import '../modules/user/store/state.dart';

@immutable
class AppState {
  final UserState userState;
  final FoodState foodState;
  final CartState cartState;
  final NavigationState navigationState;

  AppState({
    @required this.userState,
    @required this.foodState,
    @required this.cartState,
    @required this.navigationState,
  });

  factory AppState.initial() => AppState(
        userState: UserState.initial(),
        foodState: FoodState.initial(),
        cartState: CartState.initial(),
        navigationState: NavigationState.initial(),
      );

  AppState copyWith({
    UserState authState,
    FoodState foodState,
    CartState cartState,
    NavigationState navigationState,
  }) =>
      AppState(
        userState: authState ?? this.userState,
        foodState: foodState ?? this.foodState,
        cartState: cartState ?? this.cartState,
        navigationState: navigationState ?? this.navigationState,
      );
}
