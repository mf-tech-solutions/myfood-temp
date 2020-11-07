import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'product_card.dart';
import '../../store/selectors.dart';
import '../../store/state.dart';
import '../../../../store/state.dart';
import '../../models/category.dart';
import '../../models/product.dart';

typedef ProductTapHandler = void Function({
  BuildContext context,
  @required Product product,
});

class CategoriesProductsCardList extends StatelessWidget {
  final Category category;

  CategoriesProductsCardList({
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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              this.category.name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 16),
          StoreConnector<AppState, FoodState>(
            converter: (store) => store.state.foodState,
            builder: (context, state) {
              if (state.loadingProducts)
                return Center(child: CircularProgressIndicator());

              final products = getProductsByCategory(this.category.id);

              return ListView.separated(
                itemCount: products.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (_, index) => itemBuilder(products[index]),
                separatorBuilder: (_, __) => separatorBuilder(),
              );
            },
          ),
        ],
      ),
    );
  }
}
