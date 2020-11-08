import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../components/large_card.dart';
import '../../store/state.dart';
import '../../components/app_bar/app_bar.dart';
import '../../modules/auth/store/state.dart';
import '../../modules/auth/components/user_screen/user_avatar.dart';
import '../../modules/auth/components/user_screen/user_payment_info_form.dart';
import '../../modules/auth/components/user_screen/user_personal_info_form.dart';

class UserScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: MyAppBar(title: ''),
      backgroundColor: theme.primaryColor,
      body: StoreConnector<AppState, AuthState>(
        converter: (store) => store.state.authState,
        builder: (_, state) {
          if (state.loading) return loadingUser;

          if (state.user == null) return noUser;

          return ListView(
            padding: EdgeInsets.all(12),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserAvatar(user: state.user),
                ],
              ),
              SizedBox(height: 32),
              LargeCard(
                child: UserPersonalInfoForm(),
              ),
              SizedBox(height: 16),
              LargeCard(
                child: UserPaymentInfoForm(),
              ),
            ],
          );
        },
      ),
    );
  }
}
