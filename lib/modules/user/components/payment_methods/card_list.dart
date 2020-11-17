import 'dart:math';

import 'package:MyFood/constants.dart';
import 'package:MyFood/modules/user/store/state.dart';
import 'package:MyFood/store/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CardList extends StatelessWidget {
  Widget get noCards {
    return Center(
      child: Text('Não foi encontrado nenhum cartão registrado.'),
    );
  }

  Widget _cardItemBuilder(_, int index) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(16, 2, 12, 4),
      title: Text('Cartão ${index + 1}'),
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
        child: StoreConnector<AppState, UserState>(
          converter: (store) => store.state.authState,
          builder: (_, auth) {
            final length = Random().nextBool() ? 1 : 0;

            return AnimatedCrossFade(
              firstChild: noCards,
              secondChild: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: length,
                itemBuilder: _cardItemBuilder,
                separatorBuilder: _separatorBuilder,
              ),
              crossFadeState: length == 0
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
