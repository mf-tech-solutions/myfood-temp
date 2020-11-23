import 'package:flutter/material.dart';

import '../../components/app_bar/app_bar.dart';
import '../../modules/cart/components/order_status.dart';

class OrderStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: MyAppBar(title: ''),
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OrderStatusView(),
          ],
        ),
      ),
    );
  }
}
