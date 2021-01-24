import 'package:flutter/material.dart';

import '../../models/category.dart';

class CategoryCard extends StatelessWidget {
  final double _radiusSize = 12;

  final Category category;
  final double height;
  final double width;
  final Function onTapCallback;

  const CategoryCard({
    Key key,
    @required this.category,
    this.height = 192,
    this.width = 168,
    this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.subtitle1;

    final card = SizedBox(
      width: width,
      height: height,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(category.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(_radiusSize),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category.name,
                    style: textStyle,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return GestureDetector(
      child: card,
      onTap: onTapCallback,
    );
  }
}
