import 'package:MyFood/modules/navigation/store/selectors.dart';
import 'package:flutter/material.dart';

import 'actions.dart';
import '../../../store/store.dart';

void setCurrentIndex(int index) {
  AppStore.store.dispatch(SetCurrentIndexAction(index: index));
}

void updateRootScaffoldKey(GlobalKey<ScaffoldState> key) {
  final keyFromStore = getRootScaffoldKey();
  final update = () => AppStore.store.dispatch(SetRootScaffoldKeyAction(key));

  if (key == null) {
    update();
  } else if (keyFromStore.hashCode != key.hashCode) {
    update();
  }
}
