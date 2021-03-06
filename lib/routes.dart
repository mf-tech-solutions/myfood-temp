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
import 'screens/cart/set_social_id.dart';
import 'screens/food/game/game_screen.dart';
import 'screens/food/game/games_screen.dart';
import 'screens/food/recipe/recipe_screen.dart';
import 'screens/food/recipe/recipes_screen.dart';
import 'screens/food/search_screen.dart';
import 'screens/home.dart';
import 'screens/landing.dart';
import 'screens/menu.dart';
import 'screens/onboarding.dart';
import 'screens/root.dart';
import 'screens/user/login.dart';
import 'screens/user/signup.dart';
import 'screens/user/user.dart';
import 'screens/user/user_edit.dart';
import 'screens/user/user_image.dart';
import 'utils.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case addUserCardRoute:
        return Utils.cupertinoRouteBuilder(AddUserCardScreen(
          card: settings.arguments,
        ));

      case cartRoute:
        return Utils.materialPageRouteBuilder(CartScreen());

      case deliverAddressListRoute:
        return Utils.customPageRouteBuilder(DeliverAddressListScreen());

      case deliverAddAddressRoute:
        return Utils.cupertinoRouteBuilder(AddDeliverAddressScreen(
          address: settings.arguments,
        ));

      case gamesRoute:
        return Utils.customPageRouteBuilder(GamesScreen());

      case gameRoute:
        return Utils.cupertinoRouteBuilder(GameScreen(
          game: settings.arguments,
        ));

      case landingRoute:
        return Utils.cupertinoRouteBuilder(LandingScreen());

      case loginRoute:
        return Utils.materialPageRouteBuilder(LoginScreen());

      case menuRoute:
        return Utils.materialPageRouteBuilder(MenuScreen());

      case onBoardingRoute:
        return Utils.materialPageRouteBuilder(OnBoardingScreen());

      case orderListRoute:
        return Utils.customPageRouteBuilder(OrderListScreen());

      case orderStatusRoute:
        return Utils.customPageRouteBuilder(OrderStatusScreen());

      case orderSummaryRoute:
        return Utils.cupertinoRouteBuilder(OrderSummaryScreen(
          order: settings.arguments,
        ));

      case paymentMethodsRoute:
        return Utils.customPageRouteBuilder(PaymentMethodsScreen());

      case productDetailRoute:
        return Utils.customPageRouteBuilder(ProductDetailScreen(
          product: settings.arguments,
        ));

      case recipesRoute:
        return Utils.customPageRouteBuilder(RecipesScreen());

      case recipeRoute:
        return Utils.cupertinoRouteBuilder(
          RecipeScreen(
            recipe: settings.arguments,
          ),
        );

      case rootRoute:
        return Utils.materialPageRouteBuilder(RootScreen());

      case searchRoute:
        return Utils.customPageRouteBuilder(SearchScreen());

      case setSocialIdInNoteRoute:
        return Utils.customPageRouteBuilder(SetSocialIdScreen(
          socialId: settings.arguments,
        ));

      case signupRoute:
        return Utils.cupertinoRouteBuilder(SignUpScreen());

      case userRoute:
        return Utils.customPageRouteBuilder(UserScreen());

      case userEditRoute:
        return Utils.cupertinoRouteBuilder(UserEditScreen());

      case userImageRoute:
        return Utils.cupertinoRouteBuilder(UserImageScreen());

      default:
        return Utils.materialPageRouteBuilder(HomeScreen());
    }
  }
}

const String addUserCardRoute = 'addUserCard';
const String cartRoute = 'cart';
const String deliverAddressListRoute = 'userAddressList';
const String deliverAddAddressRoute = 'userAddressList/new/';
const String gamesRoute = 'games';
const String gameRoute = 'game';
const String homeRoute = 'home';
const String landingRoute = 'landing';
const String loginRoute = 'login';
const String menuRoute = 'menu';
const String onBoardingRoute = 'onboarding';
const String orderListRoute = 'orderList';
const String orderStatusRoute = 'orderStatus';
const String orderSummaryRoute = 'orderSummary';
const String paymentMethodsRoute = 'paymentMethods';
const String productDetailRoute = 'productDetails';
const String recipesRoute = 'recipes';
const String recipeRoute = 'recipe';
const String rootRoute = 'root';
const String searchRoute = 'search';
const String setSocialIdInNoteRoute = 'setSocialId';
const String signupRoute = 'signup';
const String userRoute = 'user';
const String userEditRoute = 'userEdit';
const String userImageRoute = 'userImage';
