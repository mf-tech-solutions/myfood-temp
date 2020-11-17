import 'package:flutter/material.dart';

import '../../../constants.dart';

class AuthScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tween = Tween<double>(begin: 0, end: 1);
    return Hero(
      tag: this,
      child: TweenAnimationBuilder(
        tween: tween,
        duration: Constants.widgetTransitionDuration,
        builder: (context, scale, child) => Transform.scale(
          scale: scale,
          child: child,
        ),
        child: Image.asset('assets/images/login_img.png'),
      ),
    );
  }
}
