import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final Widget child;
  final double height;
  final Color backgroundColor;
  final double elevation;
  final Function onPressed;

  const LargeButton({
    Key key,
    this.backgroundColor,
    this.elevation,
    this.height = 48,
    @required this.child,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        elevation: elevation ?? 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        child: child,
        color: backgroundColor ?? Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
