import 'package:flutter/material.dart';

import '../../../components/app_bar/app_bar.dart';
import '../../../modules/cart/components/order_confirmation_screen_content.dart';

class OrderConfirmationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: MyAppBar(title: ''),
      backgroundColor: primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: OrderConfirmationScreenContent(textColor: Colors.white),
        ),
      ),
    );
  }
}
