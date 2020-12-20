import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

class UserEditScreen extends StatefulWidget {
  @override
  _UserEditScreenState createState() => _UserEditScreenState();
}

class _UserEditScreenState extends State<UserEditScreen> {
  File _userSelectedImage;

  final _nameController = TextEditingController();
  final _cpfController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  final _cpfFormatter = CpfInputFormatter();
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

  void openImageSourcePickerBottomSheet({bool isCupertino = true}) {
    final sheet = SelectUserImageBottomSheet(
      context: context,
      isCupertino: isCupertino,
    );

    if (isCupertino) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return sheet.widget;
        },
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return sheet.widget;
        },
      );
    }
  }

  void fillControllersText() {
    final user = getUser();

    _nameController.text = user.name;
    _cpfController.text = _cpfFormatter.maskText(user.cpf);
    _phoneController.text = _phoneFormatter.maskText(user.phone);
    _emailController.text = user.email;
  }

  void save(User user) {
    updateUser(
      UserDto(
        userId: user.userId,
        cpf: _cpfFormatter.unmaskText(_cpfController.text),
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneFormatter.unmaskText(_phoneController.text),
        imageUrl: user.imageUrl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final bottomViewInset = mediaQuery.viewInsets.bottom;
    final user = getUser();
    final updating = isUpdating();

    return Scaffold(
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
                cpfController: _cpfController,
                phoneController: _phoneController,
                emailController: _emailController,
              ),
            ],
          ),
          Positioned(
            bottom: bottomViewInset == 0 ? 24 : 12,
            left: 0,
            child: SizedBox(
              width: mediaQuery.size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: LargeButton(
                  child: updating
                      ? Row(
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                            Text('SALVAR'),
                          ],
                        )
                      : Text('SALVAR'),
                  backgroundColor: theme.accentColor,
                  elevation: 4,
                  onPressed: () => save(user),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
