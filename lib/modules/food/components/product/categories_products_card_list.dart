import 'package:MyFood/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'product_card.dart';
import '../../models/category.dart';
import '../../models/product.dart';
import '../../store/action_creators.dart';
import '../../store/state.dart';
import '../../store/selectors.dart';
import '../../../../store/state.dart';
import '../../../../store/store.dart';

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
    return StoreConnector<AppState, FoodState>(
      converter: (store) => store.state.foodState,
      builder: (context, state) {
        if (state.loadingProducts)
          return Center(child: CircularProgressIndicator());

        if (state.products.length == 0) fetchProducts(AppStore.store);
        final products = getProductsByCategory(this.category.id);

        return AnimatedContainer(
          duration: Constants.widgetTransitionDuration,
          child: ListView.separated(
            itemCount: products.length,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (_, index) => itemBuilder(products[index]),
            separatorBuilder: (_, __) => separatorBuilder(),
          ),
        );
      },
    );
  }
}
