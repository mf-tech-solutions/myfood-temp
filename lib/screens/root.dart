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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserService.isFirstAccess(),
        initialData: false,
        builder: (context, snapshot) {
          final imageSize = 320.0;
          final placeholderScreen = Scaffold(
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

          if (snapshot.connectionState == ConnectionState.waiting) {
            return placeholderScreen;
          }

          if (snapshot.data == true) {
            goToRoute(context, onBoardingRoute);
          } else {
            goToRoute(context, landingRoute);
          }

          return placeholderScreen;
        });
  }
}
