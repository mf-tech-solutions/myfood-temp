import 'models/user.dart';

class AuthService {
  static User _user = User(
    'Dummy',
    'https://cdn.dumpaday.com/wp-content/uploads/2018/09/photos-21-3.jpg',
    'R. Rua Sem Nome, Nº 0',
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
}
