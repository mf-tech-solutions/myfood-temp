import 'package:flutter/material.dart' show immutable, required;
import '../modules/cart/store/state.dart';
import '../modules/food/store/state.dart';
import '../modules/navigation/store/state.dart';
import '../modules/user/store/state.dart';

@immutable
class AppState {
  final AuthState authState;
  final FoodState foodState;
  final CartState cartState;
  final NavigationState navigationState;

  AppState({
    @required this.authState,
    @required this.foodState,
    @required this.cartState,
    @required this.navigationState,
  });

  factory AppState.initial() => AppState(
        authState: AuthState.initial(),
        foodState: FoodState.initial(),
        cartState: CartState.initial(),
        navigationState: NavigationState.initial(),
      );

  AppState copyWith({
    AuthState authState,
    FoodState foodState,
    CartState cartState,
    NavigationState navigationState,
  }) =>
      AppState(
        authState: authState ?? this.authState,
        foodState: foodState ?? this.foodState,
        cartState: cartState ?? this.cartState,
        navigationState: navigationState ?? this.navigationState,
      );
}
