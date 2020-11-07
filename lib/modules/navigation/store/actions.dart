import 'package:flutter/material.dart' show immutable, required;
import '../../../store/store.dart';

@immutable
class SetCurrentIndexPayload {
  final int index;

  SetCurrentIndexPayload(this.index);
}

class SetCurrentIndexAction {
  SetCurrentIndexPayload payload;

  SetCurrentIndexAction({@required int index}) {
    payload = SetCurrentIndexPayload(index);
  }
}

void setCurrentIndex(int index) {
  AppStore.store.dispatch(SetCurrentIndexAction(index: index));
}
