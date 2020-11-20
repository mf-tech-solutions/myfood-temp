import 'package:MyFood/components/price_text.dart';
import 'package:flutter/material.dart';
import '../../food/models/product.dart';

class ProductCard extends StatelessWidget {
  final IProduct product;

  const ProductCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 8 * 24.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.fitHeight,
              ),
              color: Colors.black12,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: textTheme.headline6.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    PriceText(
                      price: product.unitaryPrice,
                      style: textTheme.headline6,
                    ),
                  ],
                ),
                if (product.description != null)
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      product.description,
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
