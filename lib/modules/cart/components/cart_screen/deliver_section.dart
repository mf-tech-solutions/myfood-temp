import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../resource.dart';
import '../../store/actionCreators.dart';
import '../../../user/models/user.dart';
import '../../../../constants.dart';
import '../../../../store/state.dart';

class DeliverSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final primaryColor = theme.primaryColor;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: StoreConnector<AppState, bool>(
          converter: (store) => store.state.cartState.isDeliver,
          builder: (_, isDeliver) {
            final titleText =
                isDeliver ? CartResource.deliver : CartResource.withdraw;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(titleText, style: textTheme.subtitle1),
                    Switch(
                      activeColor: primaryColor,
                      value: isDeliver,
                      onChanged: (_) => toggleDeliverOption(),
                    ),
                  ],
                ),
                StoreConnector<AppState, User>(
                  converter: (store) => store.state.authState.user,
                  builder: (_, user) {
                    if (user == null) return SizedBox(height: 0);

                    return AnimatedCrossFade(
                      firstChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            CartResource.address,
                            style: textTheme.subtitle2,
                          ),
                          SizedBox(height: 4),
                          Text(user.address.toString()),
                          SizedBox(height: 8),
                        ],
                      ),
                      secondChild: SizedBox(height: 0),
                      crossFadeState: isDeliver
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Constants.widgetTransitionDuration,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}