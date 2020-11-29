import '../modules/cart/store/reducer.dart';
import '../modules/food/store/reducer.dart';
import '../modules/user/store/reducer.dart';
import '../modules/navigation/store/reducer.dart';
import 'state.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    userState: authReducer(state.userState, action),
    foodState: foodReducer(state.foodState, action),
    cartState: cartReducer(state.cartState, action),
    navigationState: navigationReducer(state.navigationState, action),
  );
}
