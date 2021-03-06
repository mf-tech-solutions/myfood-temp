import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../components/small_icon_button.dart';
import '../../../../constants.dart';
import '../../../../routes.dart';
import '../../../../store/state.dart';
import '../../models/card.dart';
import '../../models/payment_method.dart';
import '../../models/payment_mothod_type.dart';
import '../../store/action_creators.dart';
import '../../store/selectors.dart';
import '../../store/state.dart';
import '../formatters.dart';

class PaymentMethodsList extends StatelessWidget {
  final _cardFormatter = UserCardLastDigitsFormatter();
  final _padding = EdgeInsets.symmetric(vertical: 12);

  Widget get _loader {
    return Center(child: CircularProgressIndicator());
  }

  Widget get _noCardsMessage {
    return Center(
      child: Text('Não foi encontrado nenhum cartão registrado.'),
    );
  }

  Widget get _moneyCard {
    final selectedPaymentMethod = getSelectedPaymentMethod();

    return Card(
      child: RadioListTile<PaymentMethodType>(
        groupValue: selectedPaymentMethod?.type,
        value: PaymentMethodType.MONEY,
        title: Text('Dinheiro'),
        onChanged: (_) => setPaymentMethod(PaymentMethod.money()),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<UserCard> cards) {
    final cardList = cards == null
        ? Container()
        : ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: cards.length,
            itemBuilder: (_, index) => _cardItemBuilder(context, cards, index),
            separatorBuilder: _separatorBuilder,
          );

    return cardList;
  }

  Widget _cardItemBuilder(BuildContext context, List<UserCard> cards, index) {
    final card = cards[index];
    final paymentMethod = PaymentMethod(
      PaymentMethodType.CARD,
      cardId: card.id,
    );
    final selectedPaymentMethod = getSelectedPaymentMethod();

    return RadioListTile<int>(
      activeColor: Theme.of(context).primaryColor,
      groupValue: selectedPaymentMethod?.cardId,
      value: card.id,
      title: Text(_cardFormatter.maskText(card.lastDigits)),
      onChanged: (_) => setPaymentMethod(paymentMethod),
      secondary: SmallIconButton(
        child: Icon(Icons.edit),
        onTapCallback: () => goToAddUserCardScreen(context, card: card),
      ),
    );
  }

  Widget _separatorBuilder(_, __) => Divider(height: 0);

  void goToAddUserCardScreen(BuildContext context, {UserCard card}) {
    Navigator.of(context).pushNamed(addUserCardRoute, arguments: card);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CartState>(
      converter: (store) => store.state.cartState,
      builder: (_, state) {
        final cards = state.cards;

        if (shouldLoadCards()) getUserCards();

        if (state.loadingCards) return _loader;

        return Column(
          children: [
            Card(
              child: Padding(
                padding: _padding,
                child: AnimatedCrossFade(
                  firstChild: _noCardsMessage,
                  secondChild: _buildList(context, cards),
                  crossFadeState: cards == null || cards.length == 0
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Constants.widgetTransitionDuration,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            Divider(height: 32),
            _moneyCard,
          ],
        );
      },
    );
  }
}
