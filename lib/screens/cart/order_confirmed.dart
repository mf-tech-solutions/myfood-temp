import 'package:flutter/material.dart';

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
            SizedBox(
              height: 96,
              width: 96,
              child: CircleAvatar(
                child: Icon(
                  Icons.check_circle,
                  size: 36,
                ),
              ),
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
