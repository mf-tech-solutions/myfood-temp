import 'package:MyFood/components/large_icon_avatar.dart';
import 'package:MyFood/modules/cart/models/order_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../store/state.dart';
import '../../../store/state.dart';

class OrderStatusView extends StatelessWidget {
  String getOrderStatusText(OrderStatus orderStatus) {
    switch (orderStatus) {
      case OrderStatus.preparing:
        return 'Seu pedido está sendo preparado!';

      default:
        return 'Teste';
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = Colors.white;
    final textTheme = Theme.of(context).textTheme;
    final infoTextStyle = textTheme.subtitle1.copyWith(color: textColor);
    final estimatedTimeLabelTextStyle = textTheme.bodyText1.copyWith(
      color: textColor,
      fontWeight: FontWeight.w500,
    );
    final timeTextStyle = textTheme.headline3.copyWith(color: textColor);

    return Center(
      child: StoreConnector<AppState, CartState>(
        converter: (store) => store.state.cartState,
        builder: (_, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'orderScreenIcon',
                child: LargeIconAvatar(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child:
                        SvgPicture.asset('assets/images/order_preparing.svg'),
                  ),
                  size: 160,
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Hero(
                tag: 'orderInfoText',
                child: Text(
                  getOrderStatusText(state.orderStatus),
                  style: infoTextStyle.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 40),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tempo estimado para entrega'.toUpperCase(),
                    style: estimatedTimeLabelTextStyle,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '00:00',
                    style: timeTextStyle,
                  ),
                ],
              ),
              SizedBox(height: 40),
              Column(
                mainAxisSize: MainAxisSize.min,
              ),
              SizedBox(height: 48),
            ],
          );
        },
      ),
    );
  }
}
