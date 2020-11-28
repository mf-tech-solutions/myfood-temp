import 'dart:async';

import 'package:MyFood/store/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/order_status.dart';
import '../store/selectors.dart';
import '../../../routes.dart';
import '../../../components/large_button.dart';
import '../../../components/large_icon_avatar.dart';

class OrderConfirmationScreenContent extends StatelessWidget {
  final Color textColor;

  const OrderConfirmationScreenContent({
    Key key,
    this.textColor = Colors.black87,
  }) : super(key: key);

  dynamic getIconUrl(OrderStatus status) {
    if (status == OrderStatus.confirmed) {
      return 'assets/images/order_confirmed.svg';
    } else if (status == OrderStatus.denied) {
      return Icons.cancel_rounded;
    } else if (status != OrderStatus.none) {
      return 'assets/images/order_confirmed.svg';
    }
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  void goToOrderStatusScreen(BuildContext context) {
    void run() {
      scheduleMicrotask(() {
        Navigator.of(context).pushReplacementNamed(orderStatusRoute);
      });
    }

    run();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textStyle = Theme.of(context).textTheme.subtitle1;

    return StoreConnector<AppState, OrderStatus>(
      converter: (store) => store.state.cartState.orderStatus,
      builder: (_, status) {
        if (status.index >= OrderStatus.preparing.index)
          goToOrderStatusScreen(context);

        final iconUrl = getIconUrl(status);
        final icon = iconUrl is String
            ? SvgPicture.asset(iconUrl)
            : Icon(
                iconUrl,
                color: primaryColor,
                size: 128,
              );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'orderScreenIcon',
              child: LargeIconAvatar(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: icon,
                ),
                size: 192,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Hero(
              tag: 'orderInfoText',
              child: Text(
                getOrderStatusText(status),
                textAlign: TextAlign.center,
                style: textStyle.copyWith(color: Colors.white),
              ),
            ),
            if (status != OrderStatus.denied) ...[
              SizedBox(height: 32),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LargeButton(
                    child: Text(
                      'SITUAÇÃO DO PEDIDO',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: primaryColor),
                    ),
                    backgroundColor: Colors.white,
                    onPressed: () => goToOrderStatusScreen(context),
                  ),
                ],
              ),
            ],
            SizedBox(height: 48),
          ],
        );
      },
    );
  }
}
