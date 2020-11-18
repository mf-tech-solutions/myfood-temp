import 'package:MyFood/modules/cart/components/formatters.dart';
import 'package:MyFood/modules/cart/models/payment_method.dart';
import 'package:MyFood/modules/cart/store/selectors.dart';
import 'package:flutter/material.dart';

class PaymentMethodView extends StatelessWidget {
  final _cardFormatter = UserCardLastDigitsFormatter();

  final PaymentMethod paymentMethod;
  final Function onTapCallback;

  PaymentMethodView({
    Key key,
    @required this.paymentMethod,
    @required this.onTapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (paymentMethod == null) return SizedBox(height: 0);

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final card = getCardById(cardId: paymentMethod.cardId);

    final icon = Icon(
      card != null
          ? Icons.credit_card_rounded
          : Icons.account_balance_wallet_rounded,
    );

    final title = Text(
      card != null ? 'Cartão de crédito/débito' : 'Dinheiro',
    );

    final info = card != null
        ? Text(
            _cardFormatter.maskText(card.lastDigits),
            style: textTheme.subtitle1.copyWith(
              color: theme.disabledColor,
            ),
          )
        : null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            icon,
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                SizedBox(height: 4),
                if (info != null) info,
              ],
            ),
          ],
        ),
        TextButton(
          child: Text('Trocar'),
          onPressed: onTapCallback,
        ),
      ],
    );
  }
}
