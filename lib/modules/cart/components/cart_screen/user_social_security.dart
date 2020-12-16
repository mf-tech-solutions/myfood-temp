import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../../../store/state.dart';
import '../../store/state.dart';
import '../formatters.dart';

class SocialIdView extends StatelessWidget {
  final _formatter = CpfFormatter();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return StoreConnector<AppState, CartState>(
      converter: (store) => store.state.cartState,
      builder: (_, state) {
        final includeSocialIdInNote = state.includeSocialIdInNote;
        if (!includeSocialIdInNote) {
          return Text('CPF não incluso');
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('CPF na nota'),
            SizedBox(height: 4),
            Text(
              _formatter.maskText(state.socialIdInNote),
              style: textTheme.subtitle1.copyWith(
                color: theme.disabledColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
