import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart' show StoreProvider;

import 'routes.dart';
import 'constants.dart';
import 'store/state.dart';
import 'store/store.dart';

class App extends StatelessWidget {
  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: AppStore.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyFood',
        initialRoute: loginRoute,
        onGenerateRoute: Routes.generateRoute,
        theme: ThemeData(
          accentColor: Constants.accentColor,
          cursorColor: Constants.primaryColor,
          indicatorColor: Constants.primaryColor,
          primaryColor: Constants.primaryColor,
          primarySwatch: Constants.primarySwatch,
          splashColor: Constants.accentColorLight,
          scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          iconTheme: IconThemeData(color: Colors.black87),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Constants.accentColor,
            backgroundColor: Colors.white,
          ),
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            splashColor: Constants.accentColor,
          ),
          cardTheme: CardTheme(
            margin: const EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 0,
          ),
          textTheme: TextTheme(
            headline5: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
            button: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.25,
            ),
          ),
        ),
        builder: (context, child) => GestureDetector(
          onTap: () => hideKeyboard(context),
          child: child,
        ),
      ),
    );
  }
}
