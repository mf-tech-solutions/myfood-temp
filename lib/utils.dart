import 'package:flutter/material.dart';

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
      barrierLabel: 'barrier',
      transitionDuration: Constants.widgetTransitionDuration,
      pageBuilder: (_, animation1, ___) {
        final tween = Tween<double>(begin: 0, end: 1);
        final animation = CurvedAnimation(
          curve: Curves.fastOutSlowIn,
          parent: animation1,
        );

        return ScaleTransition(
          scale: tween.animate(animation),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Dismissible(
              key: Key('orderConfirmedDismiss'),
              direction: DismissDirection.vertical,
              onDismissed: (_) => Navigator.of(context).pop(),
              movementDuration: Constants.widgetTransitionDuration,
              child: AlertDialog(
                buttonPadding: EdgeInsets.zero,
                actionsPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.all(contentPadding ?? 12),
                titlePadding: EdgeInsets.zero,
                insetPadding:
                    EdgeInsets.symmetric(horizontal: insetPadding ?? 8),
                backgroundColor:
                    backgroundColor ?? theme.scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                content: child,
              ),
            ),
          ),
        );
      },
    );
  }

  static PageRouteBuilder pageRouteBuilder(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => screen,
      transitionDuration: Constants.pageTransitionDuration,
      transitionsBuilder: (_, primaryAnimation, __, child) {
        final tween = Tween(begin: Offset(0, 1), end: Offset.zero);
        final animation = CurvedAnimation(
          parent: primaryAnimation,
          curve: Curves.fastOutSlowIn,
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
