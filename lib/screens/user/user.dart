import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../components/app_bar/app_bar.dart';
import '../../components/large_card.dart';
import '../../constants.dart';
import '../../modules/user/components/user_screen/user_avatar.dart';
import '../../modules/user/components/user_screen/user_payment_info.dart';
import '../../modules/user/components/user_screen/user_personal_info.dart';
import '../../modules/user/store/state.dart';
import '../../routes.dart';
import '../../store/state.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _textColor = Colors.white;

  Widget get loadingUser {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(_textColor),
      ),
    );
  }

  Widget get noUser {
    return Center(
      child: Text(
        'Usuário não encontrado.',
        style: TextStyle(color: _textColor),
      ),
    );
  }

  Widget get editButton {
    return TextButton(
      child: Text(
        'EDITAR',
        style: TextStyle(color: Constants.blackTextColor),
      ),
      onPressed: goToEditScreen,
    );
  }

  void goToEditScreen() {
    Navigator.of(context).pushNamed(userEditRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '',
        actions: [editButton],
      ),
      body: StoreConnector<AppState, UserState>(
        converter: (store) => store.state.userState,
        builder: (_, state) {
          if (state.loading) return loadingUser;

          if (state.user == null) return noUser;

          return ListView(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserAvatar(user: state.user),
                ],
              ),
              SizedBox(height: 32),
              LargeCard(child: UserPersonalInfo(user: state.user)),
              SizedBox(height: 16),
              LargeCard(child: UserPaymentInfo()),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit_rounded),
        onPressed: goToEditScreen,
      ),
    );
  }
}
