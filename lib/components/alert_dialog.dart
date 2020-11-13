import 'package:flutter/material.dart';

import '../constants.dart';

class MyAlertDialog extends AlertDialog {
  MyAlertDialog({
    Key key,
    Widget title,
    Widget content,
    EdgeInsets contentPadding,
    List<Widget> actions,
    EdgeInsets actionsPadding,
    EdgeInsets insetPadding,
    Color backgroundColor,
  }) : super(
          key: key,
          title: title,
          content: content,
          contentPadding: contentPadding ??
              const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
          actions: actions,
          insetPadding: insetPadding ??
              EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 24.0,
              ),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: Constants.popupBorderRadius,
          ),
        );
}
