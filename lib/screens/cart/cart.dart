import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

import '../../routes.dart';
import '../../constants.dart';
import '../../store/state.dart';
import '../../components/app_bar/app_bar.dart';
import '../../components/large_button.dart';
import '../../modules/cart/resource.dart';
import '../../modules/cart/store/actionCreators.dart';
import '../../modules/cart/store/state.dart';
import '../../modules/cart/store/selectors.dart';
import '../../modules/cart/components/cart_screen/deliver_section.dart';
import '../../modules/cart/components/cart_screen/cart_product_table.dart';
import '../../modules/cart/components/cart_screen/empty_card.dart';
import '../../modules/cart/components/cart_screen/payment_section.dart';
import '../../modules/navigation/store/actions.dart';

class CartScreen extends StatelessWidget {
  Widget get clearCartButton {
    return TextButton(
      child: Text(
        CartResource.clear,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: clearCart,
    );
  }

  Widget getConfirmButton(CartState state, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = 6.0;
    final enabled = !state.ordering && state.paymentMethod != null;
    final text = state.ordering ? CartResource.ordering : CartResource.confirm;

    return Positioned(
      bottom: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 2 * padding,
          horizontal: padding,
        ),
        child: SizedBox(
          width: screenWidth - 2 * padding,
          child: LargeButton(
            child: Text(text.toUpperCase()),
            onPressed: enabled ? confirm : null,
          ),
        ),
      ),
    );
  }

  void confirm() => confirmOrder();

  void goToOrderConfirmationScreen(BuildContext context) {
    void run() {
      scheduleMicrotask(
        () => Navigator.of(context).pushNamed(orderConfirmationRoute),
      );
    }

    run();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return StoreConnector<AppState, CartState>(
      converter: (store) => store.state.cartState,
      builder: (_, state) {
        if (shouldGoToOrderScreen()) {
          goToOrderConfirmationScreen(context);
        }

        final emptyCard = EmptyCard(
          onBackToMenuButtonTapHandler: () => setCurrentIndex(0),
        );

        final orderInfo = SizedBox(
          height: size.height,
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.fromLTRB(8, 24, 8, 80),
                primary: true,
                scrollDirection: Axis.vertical,
                children: [
                  CartProductTable(),
                  SizedBox(height: 16),
                  DeliverSection(),
                  SizedBox(height: 16),
                  PaymentSection(),
                ],
              ),
              getConfirmButton(state, context),
            ],
          ),
        );

        final productAmount = state.products.length;

        return Scaffold(
          appBar: MyAppBar(
            title: CartResource.cartTitle,
            actions: productAmount > 0 ? [clearCartButton] : null,
          ),
          body: AnimatedCrossFade(
            firstChild: emptyCard,
            secondChild: orderInfo,
            crossFadeState: productAmount == 0
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Constants.widgetTransitionDuration,
          ),
        );
      },
    );
  }
}
