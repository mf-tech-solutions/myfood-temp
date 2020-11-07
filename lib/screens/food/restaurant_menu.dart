import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../store/state.dart';
import '../../components/app_bar/app_bar.dart';
import '../../modules/food/components/category/categories_card_list.dart';
import '../../modules/food/components/product/categories_products_card_list.dart';
import '../../modules/food/models/category.dart';
import '../../modules/food/resource.dart';

class RestaurantMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: ListView(
        children: [
          SizedBox(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 16,
            ),
            child: Text(
              'SEARCH BOX',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 48),
          CategoriesCardList(),
          SizedBox(height: 48),
          StoreConnector<AppState, List<Category>>(
            converter: (store) => store.state.foodState.categories,
            builder: (context, categories) {
              if (categories.length == 0)
                return Text(FoodResource.emptyProductList);

              return Column(
                children: categories
                    .map(
                      (category) => Column(
                        children: [
                          CategoriesProductsCardList(category: category),
                          SizedBox(height: 36),
                        ],
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
