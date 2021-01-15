import 'package:flutter/material.dart';

import '../../../../routes.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key key, @required this.product}) : super(key: key);

  void showProductDetail(BuildContext context) {
    Navigator.of(context).pushNamed(
      productDetailRoute,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showProductDetail(context),
      child: Card(
        margin: EdgeInsets.zero,
        child: ListTile(
          title: Text(this.product.name),
          subtitle: Text('R\$ ${this.product.unitaryPrice.toStringAsFixed(2)}'),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
