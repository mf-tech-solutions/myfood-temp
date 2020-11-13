import 'package:flutter/material.dart';

import '../../models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle1;
    return Container(
      width: 136,
      child: Card(
        child: Center(
            child: Text(
          category.name,
          style: textStyle,
        )),
      ),
    );
  }
}
