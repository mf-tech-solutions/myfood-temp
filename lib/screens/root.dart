import 'dart:async';

import 'package:flutter/material.dart';

import '../modules/user/components/auth_screen_image.dart';
import '../modules/user/service.dart';
import '../routes.dart';

class RootScreen extends StatelessWidget {
  void goToRoute(BuildContext context, String route) {
    void run() {
      scheduleMicrotask(() {
        Navigator.of(context).pushReplacementNamed(route);
      });
    }

    run();
  }

  void verifyFirstAccess(BuildContext context) {
    UserService.isFirstAccess().then((isFirstAccess) {
      if (isFirstAccess == true) {
        goToRoute(context, onBoardingRoute);
      } else {
        goToRoute(context, landingRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    verifyFirstAccess(context);

    final imageSize = 320.0;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Hero(
          tag: 'app_logo',
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: imageSize,
              maxWidth: imageSize,
            ),
            child: AuthScreenImage(),
          ),
        ),
      ),
    );
  }
}
