import 'package:flutter/material.dart';

import '../../../../routes.dart';
import '../../resource.dart';

class NoAccountCheck extends StatelessWidget {
  NoAccountCheck({
    Key key,
  }) : super(key: key);

  void onTapHandler(BuildContext context) {
    Navigator.of(context).pushNamed(
      signupRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AuthResource.noAccount,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black45),
        ),
        SizedBox(width: 8),
        TextButton(
          child: Text(AuthResource.signUp),
          onPressed: () => onTapHandler(context),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
