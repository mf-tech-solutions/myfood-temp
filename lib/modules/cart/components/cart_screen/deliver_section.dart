import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../list_tile.dart';
import '../general/input_formatters.dart';
import '../../resource.dart';
import '../../models/address.dart';
import '../../store/actionCreators.dart';
import '../../store/selectors.dart';
import '../../store/state.dart';
import '../../../../constants.dart';
import '../../../../routes.dart';
import '../../../../store/state.dart';

class DeliverSection extends StatefulWidget {
  @override
  _DeliverSectionState createState() => _DeliverSectionState();
}

class _DeliverSectionState extends State<DeliverSection> {
  var _fetchedAddresses = false;
  final _zipcodeFormatter = CepInputFormatter();

  void goToSetAddressScreen(BuildContext context) {
    Navigator.of(context).pushNamed(deliverAddressListRoute);
  }

  void getAddressess() {
    getDeliverAddressess();

    void run() {
      scheduleMicrotask(() {
        setState(() => _fetchedAddresses = true);
      });
    }

    run();
  }

  String formatAddress(Address address) {
    final zipcode = _zipcodeFormatter.maskText(address.zipcode);
    return '${address.street}, Nº ${address.number} - $zipcode';
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
                StoreConnector<AppState, CartState>(
                  converter: (store) => store.state.cartState,
                  builder: (_, state) {
                    if (state.addresses.isEmpty && !_fetchedAddresses) {
                      getAddressess();
                      return Center(child: CircularProgressIndicator());
                    }

                    final deliverAddress = getDefaultDeliverAddress();
                    if (deliverAddress == null) {
                      return Center(
                        child: TextButton(
                          child: Text('Selecione um endereço'),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(deliverAddressListRoute);
                          },
                        ),
                      );
                    }

                    return AnimatedCrossFade(
                      firstChild: MyListTile(
                        title: Text(formatAddress(deliverAddress)),
                        subtitle: deliverAddress.complement == null
                            ? null
                            : Text('Complemento: ${deliverAddress.complement}'),
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
