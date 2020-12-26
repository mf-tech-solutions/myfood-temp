import 'dart:async';

import 'package:MyFood/modules/user/components/auth_screen_image.dart';
import 'package:MyFood/modules/user/models/user.dart';
import 'package:MyFood/modules/user/store/action_creators.dart';
import 'package:MyFood/routes.dart';
import 'package:MyFood/store/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool loggingIn = false;

  void login() {
    toggleLoggingIn();

    //Get token from somewhere
    loginWithToken(null).then((user) {
      goToRoute(user == null ? loginRoute : homeRoute);
    });
  }

  void toggleLoggingIn() {
    void run() {
      scheduleMicrotask(() => setState(() {
            loggingIn = !loggingIn;
          }));
    }

    run();
  }

  void goToRoute(String route) {
    void run() {
      scheduleMicrotask(() {
        Navigator.of(context).pushReplacementNamed(route);
      });
    }

    run();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User>(
      converter: (store) => store.state.userState.user,
      builder: (context, user) {
        if (!loggingIn && user == null) {
          login();
        }

        final imageSize = 320.0;

        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  child: AuthScreenImage(),
                  height: imageSize,
                  width: imageSize,
                ),
                SizedBox(height: 24),
                SizedBox(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  height: 64,
                  width: 64,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
