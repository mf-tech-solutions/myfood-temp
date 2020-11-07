import 'package:flutter/material.dart';

import '../../../components/indexed_screen.dart';
import '../../../screens/cart/cart.dart';
import '../../../screens/food/restaurant_menu.dart';
import '../../../screens/menu.dart';

@immutable
class NavigationState {
  final int currentIndex;
  final int previousIndex;
  final List<Widget> screens;
  final List<ValueKey<int>> screenKeys;

  NavigationState({
    @required this.currentIndex,
    this.screens,
    this.screenKeys,
    this.previousIndex,
  });

  factory NavigationState.initial() {
    final screenKeys = List.generate(3, (index) => ValueKey(index));

    return NavigationState(
      currentIndex: 0,
      previousIndex: 0,
      screens: [
        IndexedScreen(key: screenKeys[0], screen: RestaurantMenuScreen()),
        IndexedScreen(key: screenKeys[1], screen: CartScreen()),
        MenuScreen(key: screenKeys[2]),
      ],
      screenKeys: screenKeys,
    );
  }

  NavigationState copyWith({int index, int previousIndex}) {
    return NavigationState(
      currentIndex: index ?? this.currentIndex,
      previousIndex: previousIndex ?? this.previousIndex,
      screens: this.screens,
      screenKeys: this.screenKeys,
    );
  }
}
