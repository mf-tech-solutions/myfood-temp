import 'package:flutter/material.dart';

import 'utils.dart';
import 'constants.dart';
import 'screens/home.dart';
import 'screens/landing.dart';
import 'screens/menu.dart';
import 'screens/user/user.dart';
import 'screens/user/user_edit.dart';
import 'screens/user/login.dart';
import 'screens/cart/payment_methods.dart';
import 'screens/user/signup.dart';
import 'screens/cart/cart.dart';
import 'screens/food/games_screen.dart';
import 'screens/food/recipes_screen.dart';
import 'screens/food/search_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );

      case signupRoute:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => SignUpScreen(),
          transitionDuration: Constants.pageTransitionDuration,
          transitionsBuilder: (_, primaryAnimation, __, child) {
            final tween = Tween(begin: Offset(1, 0), end: Offset.zero);

            final animation = CurvedAnimation(
              curve: Constants.animationCurve,
              parent: primaryAnimation,
            );

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );

      case userRoute:
        return Utils.pageRouteBuilder(UserScreen());

      case userEditRoute:
        return Utils.pageRouteBuilder(UserEditScreen());

      case landingRoute:
        return MaterialPageRoute(
          builder: (_) => LandingScreen(),
        );

      case cartRoute:
        return MaterialPageRoute(
          builder: (_) => CartScreen(),
        );

      case menuRoute:
        return MaterialPageRoute(
          builder: (_) => MenuScreen(),
        );

      case recipesRoute:
        return Utils.pageRouteBuilder(RecipesScreen());

      case gamesRoute:
        return Utils.pageRouteBuilder(GamesScreen());

      case searchRoute:
        return Utils.pageRouteBuilder(SearchScreen());

      case paymentMethodsRoute:
        return Utils.pageRouteBuilder(PaymentMethodsScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
    }
  }
}

const String homeRoute = '/home';
const String cartRoute = '/cart';
const String menuRoute = '/menu';
const String recipesRoute = '/recipes';
const String gamesRoute = '/games';
const String searchRoute = '/search';
const String paymentMethodsRoute = '/paymentMethods';

const String loginRoute = '/login';
const String signupRoute = '/signup';
const String landingRoute = '/landing';
const String userRoute = '/user';
const String userEditRoute = '/userEdit';
