import 'package:MyFood/constants.dart';
import 'package:flutter/material.dart';

import 'search_no_match.dart';
import '../resource.dart';
import '../models/category.dart';
import '../models/product.dart';
import '../models/search_result.dart';
import '../../../utils.dart';
import '../../../components/bottom_sheet_wrapper.dart';
import '../../../screens/cart/product_detail.dart';
import '../../../screens/food/category_products_screen.dart';

class SearchResultView extends StatefulWidget {
  final SearchResult resultModel;

  const SearchResultView({Key key, this.resultModel}) : super(key: key);

  @override
  _SearchResultViewState createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  final _textColor = Colors.white;

  bool get _resultHasItems {
    return widget.resultModel.categories.length > 0 &&
        widget.resultModel.products.length > 0;
  }

  TextStyle get _resultSectionTitleTextStyle {
    return Theme.of(context).textTheme.headline6.copyWith(color: _textColor);
  }

  Widget getSearchResultList(
      List<Category> categories, List<Product> products) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      children: [
        Text(
          FoodResource.categoriesSection,
          style: _resultSectionTitleTextStyle,
        ),
        SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) => _mapResultItemToWidget(
            categories[index].name,
            onTapCallback: () => onCategoryItemTap(categories[index]),
          ),
          separatorBuilder: (_, __) => SizedBox(height: 12),
          itemCount: categories.length,
        ),
        SizedBox(height: 24),
        Text(
          FoodResource.productsSection,
          style: _resultSectionTitleTextStyle,
        ),
        SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) => _mapResultItemToWidget(
            products[index].name,
            onTapCallback: () => onProductItemTap(products[index]),
          ),
          separatorBuilder: (_, __) => SizedBox(height: 12),
          itemCount: products.length,
        ),
      ],
    );
  }

  Widget _mapResultItemToWidget(
    String itemName, {
    Icon icon,
    Function onTapCallback,
  }) {
    return Card(
      child: ListTile(
        title: Text(itemName),
        leading: icon,
        onTap: onTapCallback,
      ),
    );
  }

  void onCategoryItemTap(Category category) {
    Utils.showContentOnlyDialog(
      context: context,
      child: CategoryProductsScreen(category: category),
    );
  }

  void onProductItemTap(Product product) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      builder: (_) => BottomSheetWrapper(
        child: ProductDetailScreen(
          product: product,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.resultModel == null) return Container();

    final categories = widget.resultModel.categories;
    final products = widget.resultModel.products;
    final searchResultList = getSearchResultList(categories, products);
    // return searchResultList;

    return AnimatedCrossFade(
      firstChild: searchResultList,
      secondChild: SearchNoMatch(textColor: _textColor),
      crossFadeState: _resultHasItems
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Constants.widgetTransitionDuration,
    );
  }
}
