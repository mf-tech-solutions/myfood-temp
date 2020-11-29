import 'package:flutter/material.dart';

import 'large_icon_avatar.dart';

class ScreenIconAvatar extends StatelessWidget {
  final Widget child;

  const ScreenIconAvatar({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'screen_icon_avatar',
      child: LargeIconAvatar(
        child: child,
        backgroundColor: Colors.white,
        size: 8 * 24.0,
      ),
    );
  }
}
