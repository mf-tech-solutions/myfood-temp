import 'dart:async';
import 'dart:math';

import 'package:MyFood/modules/cart/models/address.dart';
import 'package:MyFood/modules/cart/models/order_status.dart';

import 'models/card.dart';

class CartService {
  static final _cardNumbers = [
    '6412',
    '7013',
    '8971',
    '1812',
    '9940',
  ];

  static final _deliverAddress = Address(
    addressId: 1,
    zipcode: '60711035',
    street: 'Rua Sem Nome',
    number: 0,
    isDefault: true,
  );

  static Future<List<UserCard>> getUserCards(int userId) async {
    _cardNumbers.shuffle(Random());

    final cardAmount = Random().nextInt(5) + 1;
    final cardNumbers = _cardNumbers.take(cardAmount).toList();
    final cards = cardNumbers
        .map(
          (e) => UserCard(
            id: int.parse(e[0]),
            lastDigits: e,
          ),
        )
        .toList();

    return Future.delayed(Duration(milliseconds: 400), () => cards);
  }

  static Future<UserCard> addUserCard(UserCardDto cardDto) async {
    final card = UserCard(
      id: Random().nextInt(999999) + 1,
      lastDigits: cardDto.lastDigits,
    );

    return Future.delayed(Duration(milliseconds: 800), () => card);
  }

  static Stream<OrderStatus> confirmOrder() {
    var status = OrderStatus.confirmed;

    final controller = StreamController<OrderStatus>();
    final stream = controller.stream;

    Timer.periodic(Duration(seconds: 3), (timer) {
      controller.sink.add(status);
      print(status);

      if (status == OrderStatus.delivered || status == OrderStatus.denied) {
        controller.close();
        timer.cancel();
      } else {
        status = OrderStatus
            .values[status.index + (status == OrderStatus.confirmed ? 2 : 1)];
      }
    });

    return stream;
  }

  static Future<List<Address>> getDeliverAddresses() {
    return Future.delayed(Duration(milliseconds: 600), () {
      // final empty = Random().nextBool();
      // if (empty) {
      //   return List();
      // }

      final addresses = [
        _deliverAddress,
        Address(
          addressId: 2,
          number: 0,
          street: 'Outra Rua Sem Nome',
          zipcode: '00000000',
          isDefault: false,
        ),
      ];

      return addresses;
    });
  }

  static Future<void> addDeliverAddress() {
    return Future.delayed(Duration(milliseconds: 600), () => null);
  }

  static Future<void> setDefaultDeliverAddress(Address address) {
    return Future.delayed(Duration(milliseconds: 600), () => null);
  }
}
