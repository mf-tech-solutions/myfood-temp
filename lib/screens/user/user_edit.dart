import 'dart:io';

import 'package:MyFood/modules/user/components/user_screen/update_dialog.dart';
import 'package:MyFood/modules/user/components/user_screen/user_info_validator.dart';
import 'package:MyFood/store/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../components/app_bar/app_bar.dart';
import '../../components/large_button.dart';
import '../../modules/user/components/general/input_formatters.dart';
import '../../modules/user/components/general/select_user_image_bottom_sheet.dart';
import '../../modules/user/components/user_screen/user_avatar.dart';
import '../../modules/user/components/user_screen/user_personal_info_form.dart';
import '../../modules/user/models/user.dart';
import '../../modules/user/models/user_dto.dart';
import '../../modules/user/store/action_creators.dart';
import '../../modules/user/store/selectors.dart';
import '../../utils.dart';

class UserEditScreen extends StatefulWidget {
  @override
  _UserEditScreenState createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  File _userSelectedImage;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _nameController = TextEditingController();
  final _socialIdController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final _socialIdFormatter = CpfInputFormatter();
  final _phoneFormatter = CellphoneInputFormatter();

  Widget get changeImageButton {
    final borderRadius = BorderRadius.circular(24);

    return Material(
      borderRadius: borderRadius,
      elevation: 2,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: openImageSourcePickerBottomSheet,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(
            child: Icon(
              Icons.camera_alt,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  _UserEditScreenState() {
    fillControllersText();
  }

  void openImageSourcePickerBottomSheet() {
    final sheet = SelectUserImageBottomSheet(context: context);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return sheet.widget;
      },
    );
  }

  void fillControllersText() {
    final user = getUser();

    _nameController.text = user.name;
    _socialIdController.text = _socialIdFormatter.maskText(user.cpf);
    _phoneController.text = _phoneFormatter.maskText(user.phone);
    _emailController.text = user.email;
  }

  void save(User user) async {
    final validationMessage = validate();
    if (validationMessage.isNotEmpty) {
      _showInvalidDataSnackBar(message: validationMessage);
      return;
    }

    await updateUser(
      UserDto(
        userId: user.userId,
        cpf: _socialIdFormatter.unmaskText(_socialIdController.text),
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneFormatter.unmaskText(_phoneController.text),
        imageUrl: user.imageUrl,
      ),
    );
    Utils.showContentOnlyDialog(
      child: UserInfoUpdateDialog(
        context: context,
        message: 'Atualizado com sucesso',
      ).dialog,
      context: context,
    );
  }

  String validate() {
    final unmaskedSocialId =
        _socialIdFormatter.unmaskText(_socialIdController.text);
    final unmaskedPhone = _phoneFormatter.unmaskText(_phoneController.text);

    final validator = UserInfoValidator(
      _nameController.text,
      unmaskedSocialId,
      unmaskedPhone,
      _emailController.text,
    );
    validator.validate();

    return validator.validationMessage;
  }

  void _showInvalidDataSnackBar({String message}) {
    final scaffold = _scaffoldKey.currentState;
    final backgroundColor = Theme.of(context).accentColor;
    final content = Text(
      message ?? 'Dados inválidos! Por favor tente novamente.',
    );

    Utils.showSnackBar(
      scaffold,
      content,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final bottomViewInset = mediaQuery.viewInsets.bottom;
    final user = getUser();

    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(title: 'Editar'),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(left: 24, right: 24, bottom: 80),
            children: [
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      UserAvatar(),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: changeImageButton,
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 48),
              UserPersonalInfoForm(
                nameController: _nameController,
                socialIdController: _socialIdController,
                phoneController: _phoneController,
                emailController: _emailController,
              ),
            ],
          ),
          Positioned(
            bottom: bottomViewInset == 0 ? 24 : 12,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: StoreConnector<AppState, bool>(
                converter: (store) => store.state.userState.updating,
                builder: (_, updating) {
                  return LargeButton(
                    child: Text(updating ? 'SALVANDO' : 'SALVAR'),
                    elevation: 4,
                    onPressed: updating ? null : () => save(user),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
