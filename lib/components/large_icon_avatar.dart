import 'package:flutter/material.dart';

class LargeIconAvatar extends StatelessWidget {
  final IconData icon;
  final Widget child;
  final Color backgroundColor;
  final Color foregroundColor;

  final double size;
  static const double _minSize = 96;

  LargeIconAvatar({
    Key key,
    this.size = _minSize,
    this.icon,
    this.child,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key) {
    assert(
      (icon != null && child == null) || (icon == null && child != null),
    );

    assert(size >= _minSize);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        child: icon != null
            ? Icon(
                icon,
                size: 36,
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(size),
                child: child,
              ),
      ),
    );
  }
}
