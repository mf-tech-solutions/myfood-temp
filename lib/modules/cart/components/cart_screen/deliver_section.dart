import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../list_tile.dart';
import '../../resource.dart';
import '../../models/deliver_info.dart';
import '../../models/deliver_type.dart';
import '../../store/actionCreators.dart';
import '../../store/selectors.dart';
import '../../../../constants.dart';
import '../../../../routes.dart';
import '../../../../store/state.dart';

class DeliverSection extends StatelessWidget {
  void goToSetAddressScreen(BuildContext context) {
    Navigator.of(context).pushNamed(userAddressesRoute);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final primaryColor = theme.primaryColor;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: StoreConnector<AppState, bool>(
          converter: (store) => store.state.cartState.isDeliver,
          builder: (_, isDeliver) {
            final titleText =
                isDeliver ? CartResource.deliver : CartResource.withdraw;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 8, 0),
                  child: Row(
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
                ),
                StoreConnector<AppState, DeliverInfo>(
                  converter: (store) => store.state.cartState.deliverInfo,
                  builder: (_, deliverInfo) {
                    if (deliverInfo.deliverType == DeliverType.deliver &&
                        deliverInfo.address == null) {
                      setDeliverInfo(getUserAddress());
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return AnimatedCrossFade(
                      firstChild: MyListTile(
                        title: Text(CartResource.address),
                        subtitle: Text(deliverInfo.address),
                        trailing: TextButton(
                          child: Text('Trocar'),
                          onPressed: () => goToSetAddressScreen(context),
                        ),
                        onTap: () => goToSetAddressScreen(context),
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
