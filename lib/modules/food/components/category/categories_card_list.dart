import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

import '../category/category_card.dart';
import '../../models/category.dart';
import '../../store/action_creators.dart';
import '../../store/state.dart';
import '../../../../utils.dart';
import '../../../../store/state.dart';
import '../../../../screens/food/category_products_screen.dart';

typedef FetchCategoriesFunction = Future<List<Category>> Function();

class CategoriesCardList extends StatelessWidget {
  void openCategoryProductsDialog(BuildContext context, Category category) {
    Utils.showContentOnlyDialog(
      context: context,
      child: CategoryProductsScreen(category: category),
      contentPadding: 16,
      insetPadding: 8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, FoodState>(
      converter: (store) => store.state.foodState,
      builder: (context, state) {
        if (state.loadingCategories) return CircularProgressIndicator();

        if (state.categories.length == 0) {
          fetchCategories();
          return Text('Categorias não disponíveis');
        }

        final categories = state.categories;
        return SizedBox(
          height: 160,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => CategoryCard(
              category: categories[index],
              onTapCallback: () => openCategoryProductsDialog(
                context,
                categories[index],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(width: 12),
          ),
        );
      },
    );
  }
}
