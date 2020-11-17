import 'models/user_dto.dart';

import 'models/address.dart';
import 'models/user.dart';

class AuthService {
  static User _user = User(
    userId: 1,
    name: 'Dummy',
    phone: '8588369766',
    cpf: '60805766359',
    email: 'dummy@email.com',
    imageUrl:
        'https://cdn.dumpaday.com/wp-content/uploads/2018/09/photos-21-3.jpg',
    address: Address(
      addressId: 1,
      zipcode: '60711035',
      street: 'Rua Sem Nome',
      number: 0,
    ),
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
}
