import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';

import '../../../components/app_bar/app_bar.dart';
import '../../../components/with_refresh_indicator.dart';
import '../../../constants.dart';
import '../../../modules/cart/components/general/empty_list_message.dart';
import '../../../modules/cart/components/general/list_tile.dart';
import '../../../modules/cart/components/general/scrollable_center.dart';
import '../../../modules/cart/models/order.dart';
import '../../../modules/cart/store/action_creators.dart';
import '../../../modules/cart/store/selectors.dart';
import '../../../routes.dart';
import '../../../store/state.dart';
import '../../../utils.dart';

class OrderListScreen extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, int index, List<Order> orderList) {
    final theme = Theme.of(context);

    final order = orderList[index];
    final orderPrice = order.cartProducts.fold(0.0, (currentPrice, element) {
      return currentPrice + element.totalPrice;
    });
    final statusText = getOrderStatusText(order.status);
    final title =
        '${order.orderId == null ? '' : 'Pedido #${order.orderId} - '}$statusText';
    final subtitle = 'Valor total: ${Utils.formatCurrency(orderPrice)}';
    final leading = order.finishedAt == null
        ? null
        : SizedBox(
            height: 56,
            width: 56,
            child: CircleAvatar(
              backgroundColor: theme.dividerColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('dd').format(order.finishedAt),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    DateFormat(DateFormat.ABBR_MONTH)
                        .format(order.finishedAt)
                        .toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            ),
          );

    final padding = EdgeInsets.only(bottom: order.isActive ? 8 : 0);

    final tile = Padding(
      padding: padding,
      child: MyListTile(
        leading: leading,
        contentPadding: EdgeInsets.symmetric(vertical: order.isActive ? 0 : 8),
        subtitle: subtitle,
        title: title,
        onTap: () => order.isActive
            ? _goToOrderStatusScreen(context)
            : _goToOrderSummaryScreen(context, order),
      ),
    );

    if (order.isActive) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: theme.dividerColor,
            style: BorderStyle.solid,
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pedido ativo',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12),
            tile,
          ],
        ),
      );
    }

    return tile;
  }

  Widget _separatorBuilder(_, __) {
    return Divider();
  }

  Future<void> _refresh() => getOrderList();

  void _goToOrderStatusScreen(BuildContext context) {
    Navigator.of(context).pushNamed(orderStatusRoute);
  }

  void _goToOrderSummaryScreen(BuildContext context, Order order) {
    Navigator.of(context).pushNamed(
      orderSummaryRoute,
      arguments: order,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Pedidos'),
      body: StoreConnector<AppState, List<Order>>(
        converter: (store) => store.state.cartState.orderList,
        builder: (_, orderList) {
          final emptyListMessage = ScrollableCenter(
            child: EmptyListMessage(
              message: 'Nenhum pedido encontrado',
            ),
          );
          final list = ListView.separated(
            itemCount: orderList.length,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            itemBuilder: (context, index) => _itemBuilder(
              context,
              index,
              orderList,
            ),
            separatorBuilder: _separatorBuilder,
          );

          final crossFade = AnimatedCrossFade(
            firstChild: emptyListMessage,
            secondChild: list,
            crossFadeState: orderList.length == 0
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Constants.widgetTransitionDuration,
          );

          return WithRefreshIndicator(
            child: crossFade,
            onRefresh: _refresh,
          );
        },
      ),
    );
  }
}
