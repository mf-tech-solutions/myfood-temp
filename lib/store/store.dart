import 'package:redux/redux.dart' show Store;
import 'package:redux_thunk/redux_thunk.dart' show thunkMiddleware;
import 'reducer.dart';
import 'state.dart';

class AppStore {
  static Store<AppState> _store;
  static Store<AppState> get store {
    if (_store == null)
      _store = Store<AppState>(
        appReducer,
        middleware: [thunkMiddleware],
        initialState: AppState.initial(),
      );
    return _store;
  }
}
