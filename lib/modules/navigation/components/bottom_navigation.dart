import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../store/actionCreators.dart';
import '../store/state.dart';
import '../../../store/state.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NavigationState>(
      converter: (store) => store.state.navigationState,
      builder: (context, state) => BottomNavigationBar(
        currentIndex: state.currentIndex,
        elevation: 0,
        onTap: setCurrentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_rounded),
            label: 'Cardápio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_rounded),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
