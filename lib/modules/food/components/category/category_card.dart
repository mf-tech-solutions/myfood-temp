import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../../../components/with_inkwell.dart';

class CategoryCard extends StatelessWidget {
  final double _radiusSize = 12;

  final Category category;
  final double size;
  final Function onTapCallback;

  const CategoryCard({
    Key key,
    @required this.category,
    this.size = 160,
    this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.subtitle1;

    final card = SizedBox(
      width: size,
      height: size,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 7,
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
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
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
            ),
          ],
        ),
      ),
    );

    return onTapCallback == null
        ? card
        : WithInkWell(
            child: card,
            borderRadius: BorderRadius.circular(_radiusSize),
            onTapCallback: onTapCallback,
          );
  }
}
