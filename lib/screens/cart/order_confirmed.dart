import 'package:flutter/material.dart';

import '../../components/large_icon_avatar.dart';

class OrderConfirmedScreen extends StatelessWidget {
  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final textStyle = Theme.of(context).textTheme.headline6;
    final width = MediaQuery.of(context).size.width;

    return Container(
      color: primaryColor,
      width: width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LargeIconAvatar(
              icon: Icons.check_circle,
            ),
            SizedBox(height: 12),
            Text(
              'Pedido confirmado!',
              style: textStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
