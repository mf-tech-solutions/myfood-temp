import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../models/product.dart';
import '../../store/selectors.dart';
import 'product_card.dart';

typedef ProductTapHandler = void Function({
  BuildContext context,
  @required Product product,
});

class CategoryProductsCardList extends StatelessWidget {
  final Category category;

  CategoryProductsCardList({
    Key key,
    @required this.category,
  }) : super(key: key);

  Widget itemBuilder(Product product) {
    return ProductCard(product: product);
  }

  Widget separatorBuilder() {
    return SizedBox(height: 12);
  }

  Widget build(BuildContext context) {
    final products = getProductsByCategory(this.category.id);
    return ListView.separated(
      itemCount: products.length,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (_, index) => itemBuilder(products[index]),
      separatorBuilder: (_, __) => separatorBuilder(),
    );
  }
}
