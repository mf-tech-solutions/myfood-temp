import 'package:flutter/material.dart';

class LargeIconAvatar extends StatelessWidget {
  final IconData icon;

  const LargeIconAvatar({Key key, @required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      width: 96,
      child: CircleAvatar(
        child: Icon(
          icon,
          size: 36,
        ),
      ),
    );
  }
}
