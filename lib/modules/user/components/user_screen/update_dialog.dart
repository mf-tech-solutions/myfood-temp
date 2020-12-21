import 'package:flutter/material.dart';

import '../../../../components/alert_dialog.dart';

class UserInfoUpdateDialog {
  final String message;
  final BuildContext context;

  Widget get dialog {
    return MyAlertDialog(
      title: Text(message),
      actions: [_confirmButton],
    );
  }

  Widget get _confirmButton {
    int popCount = 0;
    return TextButton(
      child: Text('OK'),
      onPressed: () => Navigator.of(context).popUntil(
        (_) => popCount++ >= 2,
      ),
    );
  }

  UserInfoUpdateDialog({@required this.message, @required this.context});
}
