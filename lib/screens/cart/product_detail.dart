import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../components/large_button.dart';
import '../../components/scroll_indicator.dart';
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

  String get totalPrice => cartProduct.totalPrice.toStringAsFixed(2);

  Widget getconfirmButton(CartProduct stateCartProduct) {
    String text;
    Function callback;

    if (stateCartProduct == null) {
      text = CartResource.confirm;
      if (cartProduct.amount > 0) callback = confirm;
    } else {
      if (cartProduct.amount == 0) {
        text = CartResource.remove;
        callback = remove;
      } else {
        text = CartResource.update;
        callback = confirm;
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
    showDialog(
      context: context,
      builder: (context) => RemoveFromCartDialog(
        onConfirmHandler: () {
          removeFromCart(widget.product);
          setState(() {
            this.cartProduct = this.cartProduct.copyWith(amount: 0);
          });
        },
      ),
    );
  }

  void confirm() {
    addProductToCart(this.cartProduct);
    showDialog(
      context: this.context,
      builder: (context) => AlertDialog(
        content: Text(CartResource.productAdded),
      ),
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
                Text(
                  'Total: R\$ ${this.totalPrice}',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headline5,
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
