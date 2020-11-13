import 'package:flutter/material.dart';

import 'product.dart';
import 'category.dart';

class SearchResult {
  final List<Category> categories;
  final List<Product> products;

  SearchResult({@required this.categories, @required this.products});
}
