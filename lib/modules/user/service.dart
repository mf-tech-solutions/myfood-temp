import 'dart:math';

import 'models/address.dart';
import 'models/user.dart';
import 'models/user_dto.dart';

class UserService {
  static final _user = User(
    userId: 1,
    name: 'Dummy',
    phone: '85988369766',
    cpf: '60805766359',
    email: 'dummy@email.com',
    imageUrl:
        'https://pbs.twimg.com/profile_images/1188507013233479681/WuNwaQ8R_400x400.jpg',
  );

  static final _userAddress = Address(
    addressId: 1,
    zipcode: '60711035',
    street: 'Rua Sem Nome',
    number: 0,
    isDefault: true,
  );

  static Future<User> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return Future.delayed(
      Duration(milliseconds: 600),
      () => _user,
    );
  }

  static Future<User> signUpWithEmailAndPassword(
    String email,
    String password,
  ) {
    return Future.delayed(
      Duration(milliseconds: 600),
      () => _user,
    );
  }

  static Future<void> signOut() {
    return Future.delayed(Duration(milliseconds: 400), () => null);
  }

  static Future<User> updateUser({UserDto userDto}) {
    return Future.delayed(
      Duration(milliseconds: 456),
      () => User.fromDto(userDto),
    );
  }

  static Future<List<Address>> getUserAddresses() {
    final empty = Random().nextBool();

    return Future.delayed(Duration(milliseconds: 600), () {
      if (empty) {
        return List();
      }

      final addresses = [
        _userAddress,
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

  static Future<void> addUserAddress() {
    return Future.delayed(Duration(milliseconds: 600), () => null);
  }

  static Future<void> setDefaultUserAddress(Address address) {
    return Future.delayed(Duration(milliseconds: 600), () => null);
  }
}
