import 'address.dart';
import 'deliver_type.dart';

class DeliverInfo {
  final DeliverType deliverType;
  final Address address;

  DeliverInfo({
    this.deliverType = DeliverType.deliver,
    this.address,
  });
}
