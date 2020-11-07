import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreConnector;

import '../../../components/bottom_sheet_wrapper.dart';
import '../../../screens/cart/product_detail.dart';
import '../../../store/state.dart';
import '../../food/models/product.dart';
import '../models/cart_product.dart';
import '../resource.dart';

class CartProductTable extends StatelessWidget {
  final Radius radius = Radius.circular(12);

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

  List<DataRow> getProductRows(
    List<CartProduct> products,
    BuildContext context,
  ) {
    return List.generate(
      products.length,
      (index) {
        final item = products[index];
        return DataRow(
          cells: [
            DataCell(
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Chip(
                    label: Text(
                      item.amount.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                    elevation: 0,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 8),
                  Text(item.product.name),
                ],
              ),
              onTap: () => openProductDetail(context, item.product),
            ),
            DataCell(
              Text(
                'R\$ ${item.totalPrice.toStringAsFixed(2)}',
              ),
            ),
          ],
        );
      },
    );
  }

  void openProductDetail(BuildContext context, Product product) {
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

  double getTotalPrice(List<CartProduct> cartProducts) {
    double total = 0;
    cartProducts.forEach((x) => total += x.totalPrice);
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return StoreConnector<AppState, List<CartProduct>>(
      converter: (store) => store.state.cartState.products,
      builder: (_, products) {
        if (products.length == 0)
          return Center(
            child: Text(
              CartResource.emptyCart,
              style: textTheme.headline5,
            ),
          );

        final productRows = getProductRows(products, context);
        final totalPrice = getTotalPrice(products);

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
          child: Column(
            children: [
              SingleChildScrollView(
                primary: false,
                child: DataTable(
                  dividerThickness: 1,
                  columns: columns,
                  rows: productRows,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Total: R\$ ${totalPrice.toStringAsFixed(2)}',
                style: textTheme.headline5,
              )
            ],
          ),
        );
      },
    );
  }
}
