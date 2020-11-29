import 'package:flutter/material.dart';

import '../../../store/store.dart';

GlobalKey<ScaffoldState> getRootScaffoldKey() {
  return AppStore.store.state.navigationState.rootScaffoldKey;
}
