import 'package:flutter/material.dart';

import 'additional_item.dart';
import '../../models/cart_product.dart';

typedef AdditionalItemCallback = void Function(CartProduct);

class AdditionalProductsList extends StatelessWidget {
  final CartProduct cartProduct;

  final AdditionalItemCallback add;
  final AdditionalItemCallback subtract;

  AdditionalProductsList({
    Key key,
    @required this.cartProduct,
    @required this.add,
    @required this.subtract,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final additionals = cartProduct.additionals;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Adicionais',
          style: textTheme.headline6,
        ),
        SizedBox(height: 16),
        Card(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: additionals.length,
              itemBuilder: (_, index) {
                final additional = additionals[index];
                return AdditionalItem(
                  additionalCartProduct: additional,
                  add: add,
                  subtract: subtract,
                );
              },
              separatorBuilder: (_, __) {
                return Divider(height: 6);
              },
            ),
          ),
        ),
      ],
    );
  }
}
