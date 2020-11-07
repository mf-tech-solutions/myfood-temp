import 'package:flutter/material.dart';
import '../../food/models/product.dart';

class ProductCard extends StatelessWidget {
  final IProduct product;

  const ProductCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Text(product.name),
        subtitle: Text('R\$ ${product.unitaryPrice.toStringAsFixed(2)}'),
      ),
    );
  }
}
