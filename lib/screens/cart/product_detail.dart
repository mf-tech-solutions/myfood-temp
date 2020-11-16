import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../utils.dart';
import '../../components/large_button.dart';
import '../../components/scroll_indicator.dart';
import '../../modules/cart/components/product_added.dart';
import '../../modules/cart/components/product_card.dart';
import '../../modules/cart/components/product_counter.dart';
import '../../modules/cart/components/remove_from_cart_dialog.dart';
import '../../modules/cart/models/cart_product.dart';
import '../../modules/cart/resource.dart';
import '../../modules/cart/store/actionCreators.dart';
import '../../modules/cart/store/selectors.dart';
import '../../modules/food/models/product.dart';
import '../../store/state.dart';

class ProductDetailScreen extends StatefulWidget {
  final IProduct product;

  ProductDetailScreen({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  CartProduct cartProduct;
  bool isUpdate;

  String get totalPrice => cartProduct.totalPrice.toStringAsFixed(2);

  Widget getconfirmButton(CartProduct stateCartProduct) {
    String text;
    Function callback;

    if (stateCartProduct == null) {
      text = CartResource.confirm;
      if (cartProduct.amount > 0) callback = confirm;

      isUpdate = false;
    } else {
      if (cartProduct.amount == 0) {
        text = CartResource.remove;
        callback = remove;

        isUpdate = false;
      } else {
        text = CartResource.update;
        callback = confirm;
        isUpdate = true;
      }
    }

    return LargeButton(
      child: Text(text.toUpperCase()),
      onPressed: callback,
    );
  }

  @override
  void initState() {
    super.initState();

    final cartProduct = getCartProductByProductId(widget.product.id);
    setState(
      () {
        this.cartProduct = cartProduct ??
            CartProduct(
              product: widget.product,
              amount: 0,
            );
      },
    );
  }

  void add() {
    setState(
      () => cartProduct = cartProduct.copyWith(amount: cartProduct.amount + 1),
    );
  }

  void subtract() {
    setState(
      () => cartProduct = cartProduct.copyWith(amount: cartProduct.amount - 1),
    );
  }

  void remove() {
    Utils.showContentOnlyDialog(
      context: context,
      child: RemoveFromCartDialog(
        onConfirmHandler: () {
          removeFromCart(widget.product);
          setState(() {
            this.cartProduct = this.cartProduct.copyWith(amount: 0);
          });
          Navigator.of(context).pop();
        },
        onCloseHandler: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void confirm() {
    addProductToCart(this.cartProduct);

    Utils.showContentOnlyDialog(
      context: context,
      child: ProductAddedToCartDialog(
        context: context,
        isUpdate: isUpdate,
      ).dialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return StoreConnector<AppState, CartProduct>(
      converter: (_) => getCartProductByProductId(widget.product.id),
      builder: (_, cartProduct) {
        final confirmButton = getconfirmButton(cartProduct);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ScrollIndicator(),
            SizedBox(height: 24),
            Hero(
              tag: widget.product.hashCode,
              child: ProductCard(product: widget.product),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductCounter(
                  product: widget.product,
                  amount: this.cartProduct.amount,
                  add: add,
                  subtract: subtract,
                  remove: cartProduct != null ? remove : null,
                ),
                SizedBox(width: 16),
                Row(
                  children: [
                    Text(
                      'Total: R\$ ${this.totalPrice}',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headline5,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            confirmButton,
          ],
        );
      },
    );
  }
}
