import 'package:flutter/material.dart';

import '../../modules/food/models/category.dart';
import '../../modules/food/components/product/categories_products_card_list.dart';

class CategoryProductsScreen extends StatelessWidget {
  final Category category;

  const CategoryProductsScreen({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline5;
    final size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height * 0.6),
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    category.name,
                    style: textStyle,
                  ),
                ],
              ),
              SizedBox(height: 24),
              CategoryProductsCardList(category: category),
            ],
          ),
        ),
      ),
    );
  }
}
