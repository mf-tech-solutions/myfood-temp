import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../constants.dart';
import '../../../../routes.dart';
import '../../../../store/state.dart';
import '../../../user/models/user.dart';
import '../../models/payment_method.dart';
import '../../store/action_creators.dart';
import '../../store/selectors.dart';
import 'payment_method_view.dart';
import 'user_social_security.dart';

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
        onPressed: goToPaymentMethodScreen,
      ),
    );
  }

  Widget buildSelectedPaymentMethodItem(PaymentMethod paymentMethod) {
    return withInkWell(
      PaymentMethodView(
        paymentMethod: paymentMethod,
        onTapCallback: goToPaymentMethodScreen,
      ),
      goToPaymentMethodScreen,
    );
  }

  void goToPaymentMethodScreen() {
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
                if (shouldLoadCards()) {
                  getUserCards();
                }
                return AnimatedCrossFade(
                  firstChild: setPaymentMethodButton,
                  secondChild: buildSelectedPaymentMethodItem(paymentMethod),
                  crossFadeState: paymentMethod == null
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Constants.widgetTransitionDuration,
                );
              },
            ),
            SizedBox(height: 12),
            StoreConnector<AppState, User>(
              converter: (store) => store.state.userState.user,
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
