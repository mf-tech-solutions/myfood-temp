import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'components/alert_dialog.dart';

class Utils {
  static Future<T> showContentOnlyDialog<T>({
    @required BuildContext context,
    @required Widget child,
    Color backgroundColor,
    double contentPadding,
    double insetPadding,
  }) {
    final theme = Theme.of(context);

    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'showContentOnlyDialog',
      transitionDuration: Constants.widgetTransitionDuration,
      pageBuilder: (_, animation1, ___) {
        final tween = Tween<double>(begin: 0, end: 1);
        final animation = CurvedAnimation(
          curve: Curves.fastOutSlowIn,
          parent: animation1,
        );
        final dialog = child is MyAlertDialog
            ? child
            : MyAlertDialog(
                actionsPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.all(contentPadding ?? 12),
                insetPadding:
                    EdgeInsets.symmetric(horizontal: insetPadding ?? 8),
                backgroundColor:
                    backgroundColor ?? theme.scaffoldBackgroundColor,
                content: child,
              );

        return ScaleTransition(
          scale: tween.animate(animation),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: dialog,
          ),
        );
      },
    );
  }

  static PageRouteBuilder pageRouteBuilder(Widget nextScreen) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => nextScreen,
      transitionDuration: Constants.pageTransitionDuration,
      reverseTransitionDuration: Constants.pageTransitionDuration,
      fullscreenDialog: false,
      transitionsBuilder: (_, primaryAnimation, __, child) {
        final tween = Tween(begin: Offset(0, 1), end: Offset.zero);
        final animation = CurvedAnimation(
          parent: primaryAnimation,
          curve: Curves.fastOutSlowIn,
        );

        final nextScreenTransition = SlideTransition(
          position: animation.drive(tween),
          child: child,
        );

        return nextScreenTransition;
      },
    );
  }

  static PageRouteBuilder cupertinoRouteBuilder(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => screen,
      transitionDuration: Constants.pageTransitionDuration,
      reverseTransitionDuration: Constants.pageTransitionDuration,
      transitionsBuilder: (
        _,
        primaryRouteAnimation,
        secondaryRouteAnimation,
        child,
      ) {
        return CupertinoPageTransition(
          primaryRouteAnimation: primaryRouteAnimation,
          secondaryRouteAnimation: secondaryRouteAnimation,
          child: child,
          linearTransition: false,
        );
      },
    );
  }

  static PageRouteBuilder bottomNavigationRouteBuilder(Widget nextScreen) {}

  static String formatCurrency(double value) {
    return 'R\$ ${value.toStringAsFixed(2)}';
  }
}
