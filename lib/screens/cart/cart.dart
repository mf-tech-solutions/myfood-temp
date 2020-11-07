import 'package:MyFood/modules/auth/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

import 'order_confirmed.dart';
import '../../utils.dart';
import '../../store/state.dart';
import '../../components/app_bar/app_bar.dart';
import '../../components/large_button.dart';
import '../../modules/navigation/store/actions.dart';
import '../../modules/cart/resource.dart';
import '../../modules/cart/store/actionCreators.dart';
import '../../modules/cart/components/cart_product_table.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _isDeliver = true;

  Widget get emptyCartWidget {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 96,
            width: 96,
            child: CircleAvatar(
              backgroundColor: Colors.black12,
              child: Icon(
                Icons.remove_shopping_cart_rounded,
                size: 36,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(CartResource.emptyCart),
          SizedBox(height: 12),
          RaisedButton(
            color: Theme.of(context).accentColor,
            elevation: 0,
            child: Text(CartResource.addToCartTitle),
            onPressed: () => setCurrentIndex(0),
          ),
        ],
      ),
    );
  }

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

  Widget get deliverSection {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final primaryColor = theme.primaryColor;

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _isDeliver ? 'Entrega' : 'Retirada no local',
                  style: textTheme.headline6,
                ),
                Switch(
                  activeColor: primaryColor,
                  value: _isDeliver,
                  onChanged: (_) => setState(() => _isDeliver = !_isDeliver),
                )
              ],
            ),
            StoreConnector<AppState, User>(
              converter: (store) => store.state.authState.user,
              builder: (_, user) {
                if (_isDeliver)
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        'Endereço',
                        style: textTheme.subtitle2,
                      ),
                      SizedBox(height: 4),
                      Text(user.address),
                      SizedBox(height: 8),
                    ],
                  );
                return SizedBox(height: 0);
              },
            ),
          ],
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
        return Scaffold(
          appBar: MyAppBar(
            title: CartResource.cartTitle,
            actions: productAmount > 0 ? [clearCartButton] : null,
          ),
          body: productAmount == 0
              ? emptyCartWidget
              : SizedBox(
                  height: size.height,
                  child: Stack(
                    children: [
                      ListView(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 16,
                        ),
                        primary: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          CartProductTable(),
                          SizedBox(height: 16),
                          deliverSection,
                        ],
                      ),
                      confirmButton,
                    ],
                  ),
                ),
        );
      },
    );
  }
}
