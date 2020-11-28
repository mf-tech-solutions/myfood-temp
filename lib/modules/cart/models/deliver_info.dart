import 'package:MyFood/modules/cart/models/deliver_type.dart';

class DeliverInfo {
  final DeliverType deliverType;
  final String address;

  DeliverInfo({
    this.deliverType = DeliverType.deliver,
    this.address,
  });
}
