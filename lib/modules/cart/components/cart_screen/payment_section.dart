import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../routes.dart';
import 'user_social_security.dart';
import '../../../user/models/user.dart';
import '../../../../store/state.dart';

class PaymentSection extends StatefulWidget {
  @override
  _PaymentSectionState createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  Widget withInkWell(Widget child, Function onTapCallback) {
    final padding = EdgeInsets.fromLTRB(12, 8, 4, 8);

    return InkWell(
      child: Padding(
        padding: padding,
        child: child,
      ),
      onTap: onTapCallback,
    );
  }

  void goToPaymentMethodsCreen() {
    Navigator.of(context).pushNamed(paymentMethodsRoute);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: StoreConnector<AppState, User>(
          converter: (store) => store.state.authState.user,
          builder: (_, user) {
            if (user == null) return SizedBox(height: 0);

            final paymentMethod = withInkWell(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.credit_card_rounded),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cartão de crédito/débito'),
                          SizedBox(height: 4),
                          Text(
                            '**** 0000',
                            style: textTheme.subtitle1.copyWith(
                              color: theme.disabledColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TextButton(
                    child: Text('Trocar'),
                    onPressed: goToPaymentMethodsCreen,
                  ),
                ],
              ),
              goToPaymentMethodsCreen,
            );

            final taxNote = withInkWell(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserSocialSecutiryView(user: user),
                  TextButton(
                    child: Text('Trocar'),
                    onPressed: () {},
                  ),
                ],
              ),
              () {},
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                paymentMethod,
                SizedBox(height: 12),
                taxNote,
              ],
            );
          },
        ),
      ),
    );
  }
}
