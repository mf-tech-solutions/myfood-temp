import 'package:flutter/material.dart';

//region Set current index
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
//endregion

//region Set root scaffol key
class SetRootScaffoldKeyPayload {
  final GlobalKey<ScaffoldState> key;

  SetRootScaffoldKeyPayload(this.key);
}

class SetRootScaffoldKeyAction {
  SetRootScaffoldKeyPayload payload;

  SetRootScaffoldKeyAction(GlobalKey<ScaffoldState> key) {
    payload = SetRootScaffoldKeyPayload(key);
  }
}
//endregion
