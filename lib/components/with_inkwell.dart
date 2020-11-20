import 'package:flutter/material.dart';

class WithInkWell extends StatelessWidget {
  final Widget child;
  final BorderRadius borderRadius;
  final Function onTapCallback;

  WithInkWell({
    @required this.child,
    @required this.borderRadius,
    @required this.onTapCallback,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Material(
        borderRadius: borderRadius,
        child: child,
      ),
      borderRadius: borderRadius,
      onTap: onTapCallback,
    );
  }
}
