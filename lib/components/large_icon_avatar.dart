import 'package:flutter/material.dart';

class LargeIconAvatar extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;

  const LargeIconAvatar({
    Key key,
    @required this.icon,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      width: 96,
      child: CircleAvatar(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        child: Icon(
          icon,
          size: 36,
        ),
      ),
    );
  }
}
