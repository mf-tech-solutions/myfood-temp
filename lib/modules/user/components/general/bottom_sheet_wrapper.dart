import 'package:flutter/material.dart';

import '../../../../constants.dart';

class BottomSheetWrapper extends StatelessWidget {
  final Widget child;

  const BottomSheetWrapper({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      child: child,
    );
  }
}
