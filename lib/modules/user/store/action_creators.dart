import 'actions.dart';
import '../service.dart';
import '../models/user_dto.dart';
import '../../../store/store.dart';

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
