import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

import '../components/app_bar/app_bar.dart';
import '../constants.dart';
import '../modules/navigation/components/bottom_navigation.dart';
import '../modules/navigation/store/state.dart';
import '../store/state.dart';

class HomeScreen extends StatelessWidget {
  Widget transitionBuilder(
    Widget child,
    Animation<double> primaryAnimation,
    int currentIndex,
    int previousIndex,
  ) {
    final tween = currentIndex > previousIndex
        ? Tween(begin: Offset(1, 0), end: Offset.zero)
        : Tween(begin: Offset(-1, 0), end: Offset.zero);

    final animation = CurvedAnimation(
      parent: primaryAnimation,
      curve: Constants.animationCurve,
    );

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NavigationState>(
      converter: (store) => store.state.navigationState,
      builder: (context, state) {
        return Scaffold(
          body: AnimatedSwitcher(
            layoutBuilder: (currentChild, previousChildren) {
              return Stack(
                children: [
                  Scaffold(appBar: MyAppBar(title: '')),
                  currentChild,
                ],
              );
            },
            transitionBuilder: (child, animation) => transitionBuilder(
              child,
              animation,
              state.currentIndex,
              state.previousIndex,
            ),
            duration: Constants.pageTransitionDuration,
            child: IndexedStack(
              key: state.screenKeys[state.currentIndex],
              index: state.currentIndex,
              children: state.screens,
            ),
          ),
          bottomNavigationBar: BottomNavigation(),
        );
      },
    );
  }
}
