import '../models/address.dart';
import '../../../store/store.dart';

Address getDefaultUserAddress() {
  final address = AppStore.store.state.userState.addresses.firstWhere(
    (element) => element.isDefault,
    orElse: () => null,
  );

  return address;
}
