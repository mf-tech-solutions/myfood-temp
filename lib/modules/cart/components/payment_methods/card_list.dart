import 'package:MyFood/modules/cart/store/actionCreators.dart';
import 'package:MyFood/modules/cart/store/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../models/card.dart';
import '../../../../constants.dart';
import '../../../../store/state.dart';
import '../formatters.dart';

class CardList extends StatelessWidget {
  final _cardFormatter = UserCardLastDigitsFormatter();

  CardList() {
    getUserCards();
  }

  Widget get _loader {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget get _noCards {
    return Center(
      child: Text('Não foi encontrado nenhum cartão registrado.'),
    );
  }

  Widget _buildCardList(List<UserCard> cards) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cards.length,
      itemBuilder: (_, index) => _cardItemBuilder(cards[index]),
      separatorBuilder: _separatorBuilder,
    );
  }

  Widget _cardItemBuilder(UserCard card) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(16, 2, 12, 4),
      title: Text(_cardFormatter.maskText(card.lastDigits)),
      leading: Icon(Icons.credit_card_rounded),
      trailing: InkWell(
        borderRadius: BorderRadius.circular(24),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.edit_rounded),
        ),
        onTap: () {},
      ),
      onTap: () {},
    );
  }

  Widget _separatorBuilder(_, __) => Divider(height: 0);

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(vertical: 12);

    return Card(
      child: Padding(
        padding: padding,
        child: StoreConnector<AppState, CartState>(
          converter: (store) => store.state.cartState,
          builder: (_, state) {
            final cards = state.cards;
            if (cards == null) return Container();

            if (state.loadingCards) return _loader;

            return AnimatedCrossFade(
              firstChild: _noCards,
              secondChild: _buildCardList(cards),
              crossFadeState: cards.length == 0
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Constants.widgetTransitionDuration,
            );
          },
        ),
      ),
    );
  }
}
