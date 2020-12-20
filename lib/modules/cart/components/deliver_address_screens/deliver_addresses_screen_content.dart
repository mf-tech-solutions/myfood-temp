import 'package:MyFood/components/screen_icon_avatar.dart';
import 'package:MyFood/modules/cart/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';
import '../../../../routes.dart';
import '../../../../store/state.dart';
import '../../models/address.dart';
import '../../store/action_creators.dart';
import '../../store/selectors.dart';
import '../../store/state.dart';
import '../general/my_radio_list_tile.dart';
import '../general/scrollable_center.dart';
import '../general/with_refresh_indicator.dart';

class DeliverAddressesScreenContent extends StatelessWidget {
  Widget buildNoAddressesMessage(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ScrollableCenter(
      child: Text(
        'Nenhum endereço foi encontrado',
        style: textTheme.subtitle1,
      ),
    );
  }

  Widget buildAddressesList(BuildContext context, List<Address> addresses) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: addresses.length,
      itemBuilder: (_, index) {
        final address = addresses[index];
        final formattedAddress = formatAddress(address);

        return Card(
          child: MyRadioListTile<int>(
            groupValue: getDefaultDeliverAddress().addressId,
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
              onTap: () => Navigator.of(context).pushNamed(
                deliverAddAddressRoute,
                arguments: address,
              ),
            ),
            onChanged: (_) => changeDefaultDeliverAddress(address),
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

  void changeDefaultDeliverAddress(Address address) {
    setDefaultDeliverAddress(address)
        .then((_) => print('atualizado'))
        .catchError((_) => print('falha ao atualizar'));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CartState>(
      converter: (store) => store.state.cartState,
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
          getDeliverAddresses();
          return Container();
        }

        final message = buildNoAddressesMessage(context);
        final list = buildAddressesList(context, addresses);
        final listWithImage = ListView(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          children: [
            ScreenIconAvatar(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('${Utils.imagesPath}address_list.svg'),
              ),
            ),
            SizedBox(height: 24),
            list,
          ],
        );

        return WithRefreshIndicator(
          child: addresses.length == 0 ? message : listWithImage,
          onRefresh: getDeliverAddresses,
        );
      },
    );
  }
}
