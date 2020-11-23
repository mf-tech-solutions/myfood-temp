import 'package:MyFood/modules/cart/components/product_detail_screen/product_counter.dart';
import 'package:MyFood/modules/cart/models/cart_product.dart';
import 'package:MyFood/utils.dart';
import 'package:flutter/material.dart';

class AdditionalProductsList extends StatefulWidget {
  final CartProduct cartProduct;

  const AdditionalProductsList({Key key, @required this.cartProduct})
      : super(key: key);

  @override
  _AdditionalProductsListState createState() => _AdditionalProductsListState();
}

class _AdditionalProductsListState extends State<AdditionalProductsList> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final additionals = widget.cartProduct.additionals;

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
                final product = additional.product;

                return ListTile(
                  tileColor: Colors.white,
                  title: Text(product.name),
                  subtitle: Text(
                    Utils.formatCurrency(product.unitaryPrice),
                  ),
                  trailing: ProductCounter(
                    amount: additional.amount,
                    add: () {},
                    subtract: () {},
                  ),
                );
              },
              separatorBuilder: (_, __) {
                return Divider(height: 2);
              },
            ),
          ),
        ),
      ],
    );
  }
}
