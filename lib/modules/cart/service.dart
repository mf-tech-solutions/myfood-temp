import 'dart:async';
import 'dart:math';

import 'models/address.dart';
import 'models/order.dart';
import 'models/order_status.dart';

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

  static List<Order> _orders = [];

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

  static Stream<Order> placeOrder(Order order) {
    _orders = [
      ..._orders,
      order.copyWith(
        orderId: _orders.length,
        createdAt: DateTime.now(),
      ),
    ];

    var status = OrderStatus.preparing;
    final controller = StreamController<Order>();

    Timer.periodic(Duration(seconds: 3), (timer) {
      final lastRun =
          status == OrderStatus.delivered || status == OrderStatus.denied;
      final finishedAt = lastRun ? DateTime.now() : null;
      controller.sink.add(order.copyWith(
        status: status,
        finishedAt: finishedAt,
      ));

      if (lastRun) {
        controller.close();
        timer.cancel();
      } else {
        status = OrderStatus.values[status.index + 1];
      }
    });

    return controller.stream;
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
