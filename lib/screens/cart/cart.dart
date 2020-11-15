import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

import 'order_confirmed.dart';
import '../../constants.dart';
import '../../utils.dart';
import '../../store/state.dart';
import '../../components/app_bar/app_bar.dart';
import '../../components/large_button.dart';
import '../../modules/cart/resource.dart';
import '../../modules/cart/store/actionCreators.dart';
import '../../modules/cart/components/cart_screen/deliver_section.dart';
import '../../modules/cart/components/cart_screen/cart_product_table.dart';
import '../../modules/cart/components/cart_screen/empty_card.dart';
import '../../modules/cart/components/cart_screen/payment_method.dart';
import '../../modules/navigation/store/actions.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Widget get clearCartButton {
    return TextButton(
      child: Text(
        'LIMPAR',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: clearCart,
    );
  }

  Widget get confirmButton {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: screenWidth - 32,
          child: LargeButton(
            child: Text(CartResource.confirm.toUpperCase()),
            onPressed: () => confirm(context),
          ),
        ),
      ),
    );
  }

  void confirm(BuildContext context) async {
    await confirmOrder();
    Utils.showContentOnlyDialog(
      context: context,
      child: OrderConfirmedScreen(),
      contentPadding: 0,
      insetPadding: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return StoreConnector<AppState, int>(
      converter: (store) => store.state.cartState.products.length,
      builder: (_, productAmount) {
        final emptyCard = EmptyCard(
          onBackToMenuButtonTapHandler: () => setCurrentIndex(0),
        );

        final orderInfo = SizedBox(
          height: size.height,
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 12,
                ),
                primary: true,
                scrollDirection: Axis.vertical,
                children: [
                  CartProductTable(),
                  SizedBox(height: 16),
                  DeliverSection(),
                  SizedBox(height: 16),
                  PaymentMethodSection(),
                ],
              ),
              confirmButton,
            ],
          ),
        );

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
