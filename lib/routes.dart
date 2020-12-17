import 'package:MyFood/screens/cart/set_social_id.dart';
import 'package:flutter/material.dart';

import 'screens/cart/cart.dart';
import 'screens/cart/deliver_address/add_deliver_address.dart';
import 'screens/cart/deliver_address/deliver_address_list.dart';
import 'screens/cart/order/order_list.dart';
import 'screens/cart/order/order_status.dart';
import 'screens/cart/order/order_summary.dart';
import 'screens/cart/payment_method/add_user_card.dart';
import 'screens/cart/payment_method/payment_methods.dart';
import 'screens/cart/product_detail.dart';
import 'screens/food/games_screen.dart';
import 'screens/food/recipes_screen.dart';
import 'screens/food/search_screen.dart';
import 'screens/home.dart';
import 'screens/landing.dart';
import 'screens/menu.dart';
import 'screens/user/login.dart';
import 'screens/user/signup.dart';
import 'screens/user/user.dart';
import 'screens/user/user_edit.dart';
import 'utils.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case addUserCardRoute:
        return Utils.cupertinoRouteBuilder(AddUserCardScreen(
          card: settings.arguments,
        ));

      case cartRoute:
        return MaterialPageRoute(builder: (_) => CartScreen());

      case deliverAddressListRoute:
        return Utils.pageRouteBuilder(DeliverAddressListScreen());

      case deliverAddAddressRoute:
        return Utils.cupertinoRouteBuilder(AddDeliverAddressScreen(
          address: settings.arguments,
        ));

      case gamesRoute:
        return Utils.pageRouteBuilder(GamesScreen());

      case landingRoute:
        return MaterialPageRoute(builder: (_) => LandingScreen());

      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case menuRoute:
        return MaterialPageRoute(builder: (_) => MenuScreen());

      case orderListRoute:
        return Utils.pageRouteBuilder(OrderListScreen());

      case orderStatusRoute:
        return Utils.pageRouteBuilder(OrderStatusScreen());

      case orderSummaryRoute:
        return Utils.cupertinoRouteBuilder(OrderSummaryScreen(
          order: settings.arguments,
        ));

      case paymentMethodsRoute:
        return Utils.pageRouteBuilder(PaymentMethodsScreen());

      case productDetailRoute:
        return Utils.pageRouteBuilder(ProductDetailScreen(
          product: settings.arguments,
        ));

      case recipesRoute:
        return Utils.pageRouteBuilder(RecipesScreen());

      case searchRoute:
        return Utils.pageRouteBuilder(SearchScreen());

      case setSocialIdInNoteRoute:
        return Utils.pageRouteBuilder(SetSocialIdScreen(
          socialId: settings.arguments,
        ));

      case signupRoute:
        return Utils.cupertinoRouteBuilder(SignUpScreen());

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
const String deliverAddressListRoute = 'userAddressList';
const String deliverAddAddressRoute = 'userAddressList/new/';
const String gamesRoute = 'games';
const String homeRoute = 'home';
const String landingRoute = 'landing';
const String loginRoute = 'login';
const String menuRoute = 'menu';
const String orderListRoute = 'orderList';
const String orderStatusRoute = 'orderStatus';
const String orderSummaryRoute = 'orderSummary';
const String paymentMethodsRoute = 'paymentMethods';
const String productDetailRoute = 'productDetails';
const String recipesRoute = 'recipes';
const String searchRoute = 'search';
const String setSocialIdInNoteRoute = 'setSocialId';
const String signupRoute = 'signup';
const String userRoute = 'user';
const String userEditRoute = 'userEdit';
