import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'payment_method_view.dart';
import 'user_social_security.dart';
import '../../models/payment_method.dart';
import '../../../user/models/user.dart';
import '../../../../routes.dart';
import '../../../../constants.dart';
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

  Widget get setPaymentMethodButton {
    return Center(
      child: TextButton(
        child: Text('Escolha um método de pagamento'),
        onPressed: goToPaymentMethodsCreen,
      ),
    );
  }

  Widget buildSelectedPaymenthMethodItem(PaymentMethod paymentMethod) {
    return withInkWell(
      PaymentMethodView(
        paymentMethod: paymentMethod,
        onTapCallback: goToPaymentMethodsCreen,
      ),
      goToPaymentMethodsCreen,
    );
  }

  void goToPaymentMethodsCreen() {
    Navigator.of(context).pushNamed(paymentMethodsRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StoreConnector<AppState, PaymentMethod>(
              converter: (store) => store.state.cartState.paymentMethod,
              builder: (_, paymentMethod) {
                return AnimatedCrossFade(
                  firstChild: setPaymentMethodButton,
                  secondChild: buildSelectedPaymenthMethodItem(paymentMethod),
                  crossFadeState: paymentMethod == null
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Constants.widgetTransitionDuration,
                );
              },
            ),
            SizedBox(height: 12),
            StoreConnector<AppState, User>(
              converter: (store) => store.state.authState.user,
              builder: (_, user) {
                if (user == null) return SizedBox(height: 0);

                return withInkWell(
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
