import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../components/app_bar/app_bar.dart';
import '../../components/search_box.dart';
import '../../components/with_refresh_indicator.dart';
import '../../modules/food/components/category/categories_card_list.dart';
import '../../modules/food/components/general/scrollable_center.dart';
import '../../modules/food/components/product/categories_products_card_list.dart';
import '../../modules/food/models/category.dart';
import '../../modules/food/resource.dart';
import '../../modules/food/store/action_creators.dart';
import '../../modules/food/store/selectors.dart';
import '../../modules/food/store/state.dart';
import '../../routes.dart';
import '../../store/state.dart';

class RestaurantMenuScreen extends StatefulWidget {
  @override
  _RestaurantMenuScreenState createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  FloatingActionButton get _floatingActionButton {
    return FloatingActionButton(
      child: Icon(Icons.search_rounded),
      onPressed: goToSearchScreen,
    );
  }

  Widget get _searchBox {
    return Hero(
      tag: 'foodSearchBox',
      child: Material(
        color: Colors.transparent,
        child: SearchBox(
          onTapCallback: goToSearchScreen,
        ),
      ),
    );
  }

  Widget buildContent(List<Category> categories) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(12, 32, 12, 24),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: _searchBox,
        ),
        SizedBox(height: 32),
        Text(
          FoodResource.categoriesSection,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height: 24),
        CategoriesCardList(),
        SizedBox(height: 40),
        buildCategoryProductsSection(categories),
      ],
    );
  }

  Widget buildCategoryProductsSection(List<Category> categories) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (_, index) => mapCategoryToWidget(categories[index]),
      separatorBuilder: (_, __) => SizedBox(height: 32),
    );
  }

  Widget mapCategoryToWidget(Category category) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.name,
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 16),
        CategoryProductsCardList(category: category),
      ],
    );
  }

  void goToSearchScreen() {
    Navigator.of(context).pushNamed(searchRoute);
  }

  Future<void> _refresh() async {
    await fetchCategories();
    await fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      floatingActionButton: _floatingActionButton,
      body: WithRefreshIndicator(
        child: StoreConnector<AppState, FoodState>(
          converter: (store) => store.state.foodState,
          builder: (_, state) {
            final categories = getCategories();
            final products = getProducts();
            if (categories.length > 0 && products.length == 0) {
              fetchProducts();
            }

            final content = buildContent(categories);
            final loading = isLoadingFoodItems();
            return loading
                ? ScrollableCenter(
                    child: CircularProgressIndicator(),
                  )
                : content;
          },
        ),
        onRefresh: _refresh,
      ),
    );
  }
}
