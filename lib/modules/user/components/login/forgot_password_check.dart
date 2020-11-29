import 'package:flutter/material.dart';

import '../../resource.dart';
import '../reset_password_alert.dart';

class ForgotPasswordCheck extends StatelessWidget {
  const ForgotPasswordCheck({
    Key key,
  }) : super(key: key);

  Future<void> onTapHandler(BuildContext context) {
    return showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => ResetPasswordAlert(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        UserResource.forgotPassword,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black45),
      ),
      onPressed: () => onTapHandler(context),
    );
  }
}
