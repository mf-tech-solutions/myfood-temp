import 'package:MyFood/components/app_bar/app_bar.dart';
import 'package:MyFood/components/large_button.dart';
import 'package:MyFood/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/large_icon_avatar.dart';

class ConfirmedOrderScreen extends StatelessWidget {
  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  void goToOrderStatusScreen(BuildContext context) {
    Navigator.of(context).pushNamed(orderStatusRoute);
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textStyle = Theme.of(context).textTheme.subtitle1;

    return Scaffold(
      appBar: MyAppBar(title: ''),
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'orderScreenIcon',
              child: LargeIconAvatar(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SvgPicture.asset('assets/images/order_confirmed.svg'),
                ),
                size: 160,
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Hero(
              tag: 'orderInfoText',
              child: Text(
                'Seu pedido foi confirmado!',
                style: textStyle.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                LargeButton(
                  child: Text(
                    'SITUAÇÃO DO PEDIDO',
                    style: TextStyle(color: primaryColor),
                  ),
                  backgroundColor: Colors.white,
                  onPressed: () => goToOrderStatusScreen(context),
                ),
              ],
            ),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
