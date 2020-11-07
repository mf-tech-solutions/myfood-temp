import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

import '../../store/action_creators.dart';
import '../../resource.dart';
import '../../../../store/store.dart';
import '../../store/state.dart';
import '../../../../store/state.dart';
import '../category/category_card.dart';
import '../../models/category.dart';

typedef FetchCategoriesFunction = Future<List<Category>> Function();

class CategoriesCardList extends StatelessWidget {
  void fetch() {
    fetchCategories(AppStore.store).then(
      (value) => fetchProducts(AppStore.store),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            FoodResource.categoriesSection,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: StoreConnector<AppState, FoodState>(
            converter: (store) => store.state.foodState,
            builder: (context, state) {
              if (state.loadingCategories) return CircularProgressIndicator();

              if (state.categories.length == 0) fetch();

              final categories = state.categories;
              return Container(
                height: 152,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CategoryCard(
                    category: categories[index],
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
