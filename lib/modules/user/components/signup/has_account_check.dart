import 'package:flutter/material.dart';

import '../../resource.dart';

class HasAccountCheck extends StatelessWidget {
  void onTapHandler(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          AuthResource.hasAccount,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black45),
        ),
        SizedBox(width: 8),
        TextButton(
          child: Text(AuthResource.sign),
          onPressed: () => onTapHandler(context),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
