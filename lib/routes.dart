import 'package:flutter/material.dart';

import 'utils.dart';
import 'constants.dart';
import 'screens/home.dart';
import 'screens/landing.dart';
import 'screens/menu.dart';
import 'screens/cart/add_user_card.dart';
import 'screens/cart/cart.dart';
import 'screens/cart/order_confirmation.dart';
import 'screens/cart/order_status.dart';
import 'screens/cart/payment_methods.dart';
import 'screens/food/games_screen.dart';
import 'screens/food/recipes_screen.dart';
import 'screens/food/search_screen.dart';
import 'screens/user/user.dart';
import 'screens/user/user_edit.dart';
import 'screens/user/login.dart';
import 'screens/user/signup.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case addUserCardRoute:
        return Utils.cupertinoRouteBuilder(AddUserCardScreen());

      case cartRoute:
        return MaterialPageRoute(builder: (_) => CartScreen());

      case gamesRoute:
        return Utils.pageRouteBuilder(GamesScreen());

      case landingRoute:
        return MaterialPageRoute(builder: (_) => LandingScreen());

      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case menuRoute:
        return MaterialPageRoute(builder: (_) => MenuScreen());

      case orderConfirmationRoute:
        return Utils.pageRouteBuilder(OrderConfirmationScreen());

      case orderStatusRoute:
        return Utils.cupertinoRouteBuilder(OrderStatusScreen());

      case paymentMethodsRoute:
        return Utils.pageRouteBuilder(PaymentMethodsScreen());

      case recipesRoute:
        return Utils.pageRouteBuilder(RecipesScreen());

      case signupRoute:
        return Utils.cupertinoRouteBuilder(SignUpScreen());

      case searchRoute:
        return Utils.pageRouteBuilder(SearchScreen());

      case userRoute:
        return Utils.pageRouteBuilder(UserScreen());

      case userEditRoute:
        return Utils.cupertinoRouteBuilder(UserEditScreen());

      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}

const String addUserCardRoute = 'addUserCard';
const String cartRoute = 'cart';
const String orderConfirmationRoute = 'confirmedOrder';
const String gamesRoute = 'games';
const String homeRoute = 'home';
const String landingRoute = 'landing';
const String loginRoute = 'login';
const String menuRoute = 'menu';
const String orderStatusRoute = 'orderStatus';
const String paymentMethodsRoute = 'paymentMethods';
const String recipesRoute = 'recipes';
const String searchRoute = 'search';
const String signupRoute = 'signup';
const String userRoute = 'user';
const String userEditRoute = 'userEdit';
