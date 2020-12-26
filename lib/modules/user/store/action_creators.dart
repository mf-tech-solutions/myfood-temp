import 'package:MyFood/modules/user/models/user.dart';

import '../../../store/store.dart';
import '../models/user_dto.dart';
import '../service.dart';
import 'actions.dart';

Future<void> login(
  String email,
  String password,
) async {
  final store = AppStore.store;
  store.dispatch(LoginAction());

  try {
    final user = await UserService.signInWithEmailAndPassword(email, password);
    store.dispatch(LoginSuccessAction(user: user));
  } catch (e) {
    store.dispatch(LoginFailAction());
  }
}

Future<User> loginWithToken(String token) async {
  final store = AppStore.store;
  store.dispatch(LoginAction());

  try {
    final user = await UserService.signInWithToken(token);
    if (user == null) {
      throw new Exception();
    }

    store.dispatch(LoginSuccessAction(user: user));
    return user;
  } catch (e) {
    store.dispatch(LoginFailAction());
    return null;
  }
}

Future<void> updateUser(UserDto userDto) async {
  AppStore.store.dispatch(UpdateUserAction());

  try {
    final user = await UserService.updateUser(userDto: userDto);
    AppStore.store.dispatch(
      UpdateUserSuccessAction(user: user),
    );
  } catch (e) {
    AppStore.store.dispatch(UpdateUserFailAction());
  }
}
