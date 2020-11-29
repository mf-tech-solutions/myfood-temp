import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../general/input_formatters.dart';
import '../general/my_radio_list_tile.dart';
import '../general/scrollable_center.dart';
import '../general/with_refresh_indicator.dart';
import '../../models/address.dart';
import '../../store/action_creators.dart';
import '../../store/selectors.dart';
import '../../store/state.dart';
import '../../../../constants.dart';
import '../../../../store/state.dart';

class UserAddressesScreenContent extends StatelessWidget {
  final _zipCodeFormatter = CepInputFormatter();

  Widget buildNoAddressesMessage(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ScrollableCenter(
      child: Text(
        'Nenhum endereço foi encontrado',
        style: textTheme.subtitle1,
      ),
    );
  }

  Widget buildAddressesList(List<Address> addresses) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: addresses.length,
      itemBuilder: (_, index) {
        final address = addresses[index];
        final formattedAddress = formatAddress(address);

        return Card(
          child: MyRadioListTile<int>(
            groupValue: getDefaultUserAddress().addressId,
            value: address.addressId,
            title: formattedAddress,
            subtitle: address.complement != null
                ? 'Complemento: ${address.complement}'
                : null,
            secondary: InkWell(
              borderRadius: BorderRadius.circular(32),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.edit,
                  color: Constants.blackTextColor,
                ),
              ),
              onTap: () {},
            ),
            onChanged: (_) => changeDefaultUserAddress(address),
          ),
        );
      },
      separatorBuilder: (_, __) {
        return SizedBox(height: 12);
      },
    );
  }

  String formatAddress(Address address) {
    return '${address.street}, Nº ${address.number}';
  }

  void changeDefaultUserAddress(Address address) {
    setDefaultUserAddress(address)
        .then((_) => print('atualizado'))
        .catchError((_) => print('falha ao atualizar'));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserState>(
      converter: (store) => store.state.userState,
      builder: (_, state) {
        if (state.loadingAddresses) {
          return Center(
            child: SizedBox(
              height: 56,
              width: 56,
              child: CircularProgressIndicator(),
            ),
          );
        }

        final addresses = state.addresses;

        if (addresses == null) {
          getUserAddressess();
          return SizedBox.shrink();
        }

        final message = buildNoAddressesMessage(context);
        final list = buildAddressesList(addresses);

        return WithRefreshIndicator(
          child: addresses.length == 0 ? message : list,
          onRefresh: getUserAddressess,
        );
      },
    );
  }
}
