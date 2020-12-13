import 'package:flutter/material.dart';

class SmallIconButton extends StatelessWidget {
  final double _size = 32;

  final Widget child;
  final Function onTapCallback;

  const SmallIconButton({
    Key key,
    @required this.child,
    @required this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size,
      width: _size,
      child: InkWell(
        borderRadius: BorderRadius.circular(_size),
        child: Center(
          child: child,
        ),
        onTap: onTapCallback,
      ),
    );
  }
}
