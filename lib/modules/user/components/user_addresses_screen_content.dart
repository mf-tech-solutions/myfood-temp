import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'list_tile.dart';
import 'scrollable_center.dart';
import '../models/address.dart';
import '../store/action_creators.dart';
import '../store/state.dart';
import '../../../constants.dart';
import '../../../store/state.dart';

class UserAddressesScreenContent extends StatelessWidget {
  final refreshIndicatorState = GlobalKey<RefreshIndicatorState>();

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
        return Card(
          child: MyListTile(
            title: Text(address.toString()),
            subtitle: Text('CEP: ${address.zipcode}'),
            trailing: IconButton(
              icon: Icon(
                Icons.edit,
                color: Constants.blackTextColor,
              ),
              onPressed: () {},
            ),
          ),
        );
      },
      separatorBuilder: (_, __) {
        return SizedBox(height: 12);
      },
    );
  }

  Widget withRefreshIndicator(Widget child) {
    return RefreshIndicator(
      key: refreshIndicatorState,
      child: child,
      onRefresh: getUserAddressess,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserState>(
      converter: (store) => store.state.userState,
      builder: (_, state) {
        if (state.gettingAddresses) {
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

        return withRefreshIndicator(addresses.length == 0 ? message : list);
      },
    );
  }
}
