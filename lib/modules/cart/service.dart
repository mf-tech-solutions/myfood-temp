import 'dart:math';

import 'models/card.dart';

class CartService {
  static final _cardNumbers = [
    '6412',
    '7013',
    '8971',
    '1812',
    '9940',
  ];

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

  static Future<void> confirmOrder() async {
    return Future.delayed(Duration(milliseconds: 400), () {});
  }
}
