import 'package:MyFood/modules/user/store/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../components/app_bar/app_bar.dart';
import '../../modules/user/components/general/list_tile.dart';
import '../../modules/user/components/user_screen/user_avatar.dart';
import '../../modules/user/components/user_screen/user_personal_info.dart';
import '../../modules/user/store/state.dart';
import '../../routes.dart';
import '../../store/state.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Widget get loadingUser {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget get noUser {
    return Center(
      child: Text(
        'Usuário não encontrado.',
      ),
    );
  }

  void goToEditScreen() {
    Navigator.of(context).pushNamed(userEditRoute);
  }

  void _signOut() async {
    //TODO: Create dialog to confirm the action
    await signOut();
    Navigator.of(context).pushNamedAndRemoveUntil(
      loginRoute,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: ''),
      body: StoreConnector<AppState, UserState>(
        converter: (store) => store.state.userState,
        builder: (_, state) {
          if (state.loading) return loadingUser;

          if (state.user == null) return noUser;

          return ListView(
            padding: EdgeInsets.all(24),
            children: [
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserAvatar(),
                ],
              ),
              SizedBox(height: 48),
              UserPersonalInfo(user: state.user),
              SizedBox(height: 32),
              Divider(),
              SizedBox(height: 24),
              MyListTile(
                leading: Icon(Icons.exit_to_app_rounded),
                title: 'Sair',
                onTap: _signOut,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'user_edit_fab',
        child: Icon(Icons.edit_rounded),
        onPressed: goToEditScreen,
      ),
    );
  }
}
