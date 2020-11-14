import 'package:MyFood/components/bottom_seet_wrapper.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../../../../screens/cart/product_detail.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key key, @required this.product}) : super(key: key);

  void showProductDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      builder: (context) => BottomSheetWrapper(
        child: ProductDetailScreen(
          product: product,
        ),
      ),
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
      ),
    );
  }
}
