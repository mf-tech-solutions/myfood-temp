import 'actions.dart';
import 'state.dart';

NavigationState navigationReducer(NavigationState state, dynamic action) {
  if (action is SetCurrentIndexAction)
    return state.copyWith(
      index: action.payload.index,
      previousIndex: state.currentIndex,
    );
  return state;
}
