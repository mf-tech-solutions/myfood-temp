import 'payment_mothod_type.dart';

class PaymentMethod {
  final PaymentMethodType type;
  final int cardId;

  PaymentMethod(this.type, {this.cardId});

  factory PaymentMethod.money() {
    return PaymentMethod(PaymentMethodType.MONEY);
  }
}
