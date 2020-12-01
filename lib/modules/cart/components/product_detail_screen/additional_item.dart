import 'package:flutter/material.dart';

import 'product_counter.dart';
import '../../models/cart_product.dart';
import '../../../../utils.dart';

typedef AdditionalItemCallback = void Function(CartProduct);

class AdditionalItem extends StatelessWidget {
  final CartProduct additionalCartProduct;

  final AdditionalItemCallback add;
  final AdditionalItemCallback subtract;

  AdditionalItem({
    Key key,
    @required this.additionalCartProduct,
    @required this.add,
    @required this.subtract,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final additional = additionalCartProduct;
    final product = additional.product;

    return ListTile(
      tileColor: Colors.white,
      title: Text(product.name),
      subtitle: Text(
        Utils.formatCurrency(product.unitaryPrice),
      ),
      trailing: ProductCounter(
        amount: additional.amount,
        add: () => add(additional),
        subtract: () => subtract(additional),
        small: true,
      ),
    );
  }
}
