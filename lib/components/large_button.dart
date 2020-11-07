import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final Widget child;
  final double height;
  final Function onPressed;

  const LargeButton({
    Key key,
    @required this.child,
    this.height = 48,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
        child: child,
        color: Theme.of(context).accentColor,
        textColor: Colors.white,
        onPressed: onPressed,
      ),
    );
  }
}
