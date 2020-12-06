import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/order.dart';
import '../store/selectors.dart';
import '../../../components/large_icon_avatar.dart';
import '../../../store/state.dart';

class OrderStatusScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textTheme = Theme.of(context).textTheme;
    final textColor = Colors.white;
    final infoTextStyle = textTheme.subtitle1.copyWith(color: textColor);
    final estimatedTimeLabelTextStyle = textTheme.bodyText1.copyWith(
      color: textColor,
      fontWeight: FontWeight.w500,
    );
    final timeTextStyle = textTheme.headline3.copyWith(color: textColor);

    return Center(
      child: StoreConnector<AppState, Order>(
        converter: (store) => store.state.cartState.currentOrder,
        builder: (_, order) {
          final iconUrl = getOrderStatusIconUrl();
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
                  getOrderStatusText(order.status),
                  textAlign: TextAlign.center,
                  style: infoTextStyle.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(height: 40),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tempo estimado para entrega'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: estimatedTimeLabelTextStyle,
                  ),
                  SizedBox(height: 8),
                  Text(
                    '00:00',
                    textAlign: TextAlign.center,
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
