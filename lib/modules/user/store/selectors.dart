import '../../../store/store.dart';
import '../models/user.dart';

User getUser() {
  return AppStore.store.state.userState.user;
}

bool isUpdating() {
  return AppStore.store.state.userState.updating;
}
