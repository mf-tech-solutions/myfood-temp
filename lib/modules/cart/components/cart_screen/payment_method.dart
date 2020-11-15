import 'package:MyFood/modules/cart/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../auth/store/state.dart';
import '../../../../store/state.dart';

class PaymentMethodSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: StoreConnector<AppState, AuthState>(
          converter: (store) => store.state.authState,
          builder: (_, auth) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  CartResource.paymentMethod.toUpperCase(),
                  style: textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                Text('Cartão')
              ],
            );
          },
        ),
      ),
    );
  }
}
