import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/alert_dialog.dart';
import 'constants.dart';

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

  static void showSnackBar(
    ScaffoldState scaffold,
    Widget content, {
    SnackBarAction action,
    Color backgroundColor,
    SnackBarBehavior behavior,
  }) {
    final defaultAction = SnackBarAction(
      label: 'FECHAR',
      textColor: Colors.white,
      onPressed: scaffold.hideCurrentSnackBar,
    );

    final radius = Radius.circular(12);
    final borderRadius =
        behavior == null ? BorderRadius.zero : BorderRadius.all(radius);

    scaffold.showSnackBar(
      SnackBar(
        action: action ?? defaultAction,
        backgroundColor: backgroundColor,
        behavior: behavior,
        padding: EdgeInsets.fromLTRB(12, 12, 8, 12),
        content: content,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
    );
  }

  static String formatCurrency(double value) {
    return 'R\$ ${value.toStringAsFixed(2)}';
  }

  static MaterialPageRoute materialPageRouteBuilder(Widget screen) {
    return MaterialPageRoute(builder: (_) => screen);
  }

  static PageRouteBuilder customPageRouteBuilder(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => screen,
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
}
