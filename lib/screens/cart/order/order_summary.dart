import 'package:flutter/material.dart';

import '../../../components/app_bar/app_bar.dart';

class OrderSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: MyAppBar(
        title: '',
      ),
      backgroundColor: theme.primaryColor,
      body: Center(
        child: Text(
          'Detalhes do pedido que vai ser recebido via \'arguments\'',
          textAlign: TextAlign.center,
          style: theme.textTheme.headline6.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
