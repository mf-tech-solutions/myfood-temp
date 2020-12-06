import 'package:flutter/material.dart';

import '../../../components/app_bar/app_bar.dart';

class OrderListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: MyAppBar(title: 'Pedidos'),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Text(
            'Imagine aqui uma lista de pedidos com o pedido atual no topo.',
            style: theme.textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
