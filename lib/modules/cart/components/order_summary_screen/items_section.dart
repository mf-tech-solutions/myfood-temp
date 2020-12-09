import 'package:MyFood/modules/cart/models/cart_product.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';
import '../../models/order.dart';
import '../../resource.dart';
import '../../utils.dart';

class OrderSummaryItemsSection extends StatelessWidget {
  final Order order;

  List<DataColumn> get columns {
    return [
      DataColumn(
        label: Text(CartResource.productNameTableHeader),
      ),
      DataColumn(
        label: Text(CartResource.productTotalPriceTableHeader),
        numeric: true,
      ),
    ];
  }

  List<DataRow> getRows(BuildContext context) {
    final textColor = Theme.of(context).primaryColor;
    final textStyle = TextStyle(
      color: textColor,
      decoration: TextDecoration.underline,
    );
    final onTap = (CartProduct cartProduct) => Navigator.of(context).pushNamed(
          productDetailRoute,
          arguments: cartProduct.product,
        );

    final rows = order.cartProducts.map((product) {
      return DataRow(
        cells: [
          DataCell(
            Text(
              '${product.amount.toString()}x ${product.product.name}',
              style: textStyle,
            ),
            onTap: () => onTap(product),
          ),
          DataCell(
            Text(
              Utils.formatCurrency(product.totalPrice),
            ),
          ),
        ],
      );
    }).toList();
    return rows;
  }

  double get totalPrice {
    final totalPrice = order.cartProducts.fold(
      0.0,
      (currentValue, element) => currentValue + element.totalPrice,
    );
    return totalPrice;
  }

  OrderSummaryItemsSection({
    Key key,
    @required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h6 = Theme.of(context).textTheme.bodyText1.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          child: DataTable(
            dividerThickness: 1,
            columns: columns,
            rows: getRows(context),
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: h6,
              ),
              Text(
                Utils.formatCurrency(totalPrice),
                style: h6,
              )
            ],
          ),
        ),
      ],
    );
  }
}
