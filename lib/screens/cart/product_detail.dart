import 'package:MyFood/components/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../utils.dart';
import '../../components/large_button.dart';
import '../../components/scroll_indicator.dart';
import '../../modules/cart/resource.dart';
import '../../modules/cart/components/product_detail_screen/additionals.dart';
import '../../modules/cart/components/product_detail_screen/product_card.dart';
import '../../modules/cart/components/product_detail_screen/product_counter.dart';
import '../../modules/cart/components/product_added.dart';
import '../../modules/cart/components/remove_from_cart_dialog.dart';
import '../../modules/cart/models/cart_product.dart';
import '../../modules/cart/store/action_creators.dart';
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

  void add() {
    setState(
      () => cartProduct = cartProduct.copyWith(amount: cartProduct.amount + 1),
    );
  }

  void addAdditional(CartProduct additional) {
    setState(() {
      final additionals = cartProduct.additionals.map((e) {
        if (e.product.id == additional.product.id) {
          return additional.copyWith(amount: additional.amount + 1);
        }
        return e;
      }).toList();

      cartProduct = cartProduct.copyWith(additionals: additionals);
    });
  }

  void subtract() {
    setState(
      () => cartProduct = cartProduct.copyWith(amount: cartProduct.amount - 1),
    );
  }

  void subtractAdditional(CartProduct additional) {
    setState(() {
      final additionals = cartProduct.additionals.map((e) {
        if (e.product.id == additional.product.id) {
          return additional.copyWith(amount: additional.amount - 1);
        }
        return e;
      }).toList();

      cartProduct = cartProduct.copyWith(additionals: additionals);
    });
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
  void initState() {
    super.initState();

    final cartProduct = getCartProductByProductId(widget.product.id);
    setState(
      () {
        if (cartProduct != null) {
          this.cartProduct = cartProduct;
        }

        final additionals = widget.product.additionals
            .map((e) => CartProduct(
                  amount: 0,
                  parentId: e.parentId,
                  product: e,
                  additionals: [],
                ))
            .toList();
        this.cartProduct = CartProduct(
          amount: 0,
          additionals: additionals,
          parentId: widget.product.parentId,
          product: widget.product,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: MyAppBar(),
      body: StoreConnector<AppState, CartProduct>(
        converter: (_) => getCartProductByProductId(widget.product.id),
        builder: (_, cartProduct) {
          final confirmButton = getconfirmButton(cartProduct);

          return ListView(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            children: [
              ProductCard(product: widget.product),
              SizedBox(height: 32),
              if (this.cartProduct.hasAdditionals)
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: AdditionalProductsList(
                    cartProduct: this.cartProduct,
                    add: addAdditional,
                    subtract: subtractAdditional,
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCounter(
                    amount: this.cartProduct.amount,
                    add: add,
                    subtract: subtract,
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
              SizedBox(height: 32),
              confirmButton,
            ],
          );
        },
      ),
    );
  }
}
