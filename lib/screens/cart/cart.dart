import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

import '../../components/app_bar/app_bar.dart';
import '../../components/large_button.dart';
import '../../constants.dart';
import '../../modules/cart/components/cart_screen/cart_product_table.dart';
import '../../modules/cart/components/cart_screen/deliver_section.dart';
import '../../modules/cart/components/cart_screen/empty_card.dart';
import '../../modules/cart/components/cart_screen/payment_section.dart';
import '../../modules/cart/models/order_status.dart';
import '../../modules/cart/resource.dart';
import '../../modules/cart/store/action_creators.dart';
import '../../modules/cart/store/selectors.dart';
import '../../modules/cart/store/state.dart';
import '../../modules/navigation/store/actionCreators.dart';
import '../../routes.dart';
import '../../store/state.dart';

class CartScreen extends StatelessWidget {
  Widget get _clearCartButton {
    return TextButton(
      child: Text(
        CartResource.clear,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: clearCart,
    );
  }

  Widget _getConfirmButton(CartState state, BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = 6.0;
    final ordering = isOrdering();
    final enabled = !ordering && state.paymentMethod != null;
    final text = ordering ? CartResource.ordering : CartResource.confirm;

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
            onPressed: enabled ? _confirm : null,
          ),
        ),
      ),
    );
  }

  bool _shouldGoToOrderScreen(CartState state) {
    final currentOrder = state.currentOrder;
    if (currentOrder == null) {
      return false;
    }

    final orderStatus = currentOrder.status;
    final result = orderStatus == OrderStatus.preparing ||
        orderStatus == OrderStatus.canceled ||
        orderStatus == OrderStatus.denied;
    return result;
  }

  void _goToOrderConfirmationScreen(BuildContext context) {
    Future.microtask(() => Navigator.of(context).pushNamed(orderStatusRoute));
  }

  void _confirm() => placeOrder();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return StoreConnector<AppState, CartState>(
      converter: (store) => store.state.cartState,
      builder: (_, state) {
        if (_shouldGoToOrderScreen(state)) {
          _goToOrderConfirmationScreen(context);
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
              _getConfirmButton(state, context),
            ],
          ),
        );

        final productAmount = state.products.length;

        return Scaffold(
          appBar: MyAppBar(
            title: CartResource.cartTitle,
            actions: productAmount > 0 ? [_clearCartButton] : null,
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
