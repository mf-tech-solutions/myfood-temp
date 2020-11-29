import 'package:MyFood/modules/user/store/selectors.dart';

import 'actions.dart';
import '../service.dart';
import '../models/address.dart';
import '../models/user_dto.dart';
import '../../../store/store.dart';

Future<void> updateUser(UserDto userDto) async {
  AppStore.store.dispatch(UpdateUserAction());

  try {
    final user = await UserService.updateUser(userDto: userDto);
    AppStore.store.dispatch(
      UpdateUserSuccessAction(user: user),
    );
  } catch (e) {
    AppStore.store.dispatch(UpdateUserFailAction());
  }
}

Future<void> getUserAddressess() async {
  AppStore.store.dispatch(GetUserAddressessAction());

  try {
    final addresses = await UserService.getUserAddresses();
    AppStore.store.dispatch(GetUserAddressessSuccessAction(addresses));
  } catch (e) {
    AppStore.store.dispatch(GetUserAddressessFailAction());
  }
}

Future<void> addUserAddress(Address address) async {
  AppStore.store.dispatch(AddUserAddressAction());

  try {
    await UserService.addUserAddress();
    AppStore.store.dispatch(AddUserAddressSuccessAction(address));
  } catch (e) {
    AppStore.store.dispatch(AddUserAddressFailAction());
  }
}

Future<void> setDefaultUserAddress(Address address) async {
  final previousDefaultAddress = getDefaultUserAddress();

  AppStore.store.dispatch(SetDefaultUserAddressAction(address));

  try {
    await UserService.setDefaultUserAddress(address);
    AppStore.store.dispatch(SetDefaultUserAddressSuccessAction());
  } catch (e) {
    AppStore.store.dispatch(
      SetDefaultUserAddressFailAction(previousDefaultAddress),
    );
  }
}
