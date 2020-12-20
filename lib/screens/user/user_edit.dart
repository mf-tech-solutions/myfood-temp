import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../components/app_bar/app_bar.dart';
import '../../components/large_button.dart';
import '../../components/large_card.dart';
import '../../modules/user/components/general/input_formatters.dart';
import '../../modules/user/components/user_avatar.dart';
import '../../modules/user/components/user_screen/user_payment_info_form.dart';
import '../../modules/user/components/user_screen/user_personal_info_form.dart';
import '../../modules/user/models/user.dart';
import '../../modules/user/models/user_dto.dart';
import '../../modules/user/store/action_creators.dart';
import '../../modules/user/store/state.dart';
import '../../store/state.dart';

class UserEditScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final cpfController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final zipcodeController = TextEditingController();
  final streetController = TextEditingController();
  final streetNumberController = TextEditingController();
  final complementController = TextEditingController();

  final _cpfFormatter = CpfInputFormatter();
  final _phoneFormatter = CellphoneInputFormatter();
  final _zipcodeFormatter = CepInputFormatter();

  void fillControllersText(User user) {
    nameController.text = user.name;
    cpfController.text = user.cpf;
    phoneController.text = user.phone;
    emailController.text = user.email;
    zipcodeController.text = user.address.zipcode;
    streetController.text = user.address.street;
    streetNumberController.text = user.address.number.toString();
    complementController.text = user.address.complement;
  }

  void save(User user) {
    updateUser(
      UserDto(
        userId: user.userId,
        cpf: _cpfFormatter.unmaskText(cpfController.text),
        name: nameController.text,
        email: emailController.text,
        phone: _phoneFormatter.unmaskText(phoneController.text),
        imageUrl: user.imageUrl,
        addressId: user.address.addressId,
        zipcode: _zipcodeFormatter.unmaskText(zipcodeController.text),
        street: streetController.text,
        streetNumber: int.parse(streetNumberController.text),
        complement: complementController.text,
        isDefaultAddress: user.address.isDefault,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: MyAppBar(
        title: 'Editar',
      ),
      body: StoreConnector<AppState, UserState>(
        converter: (store) => store.state.userState,
        builder: (_, state) {
          fillControllersText(state.user);

          return Stack(
            children: [
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(12, 24, 12, 48 + 24.0),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      UserAvatar(),
                    ],
                  ),
                  SizedBox(height: 32),
                  LargeCard(
                    child: UserPersonalInfoForm(
                      nameController: nameController,
                      cpfController: cpfController,
                      cellphoneController: phoneController,
                      zipcodeController: zipcodeController,
                      streetController: streetController,
                      streetNumberController: streetNumberController,
                      complementController: complementController,
                    ),
                  ),
                  SizedBox(height: 16),
                  LargeCard(
                    child: UserPaymentInfoForm(),
                  ),
                ],
              ),
              Positioned(
                bottom: 8,
                left: 0,
                child: SizedBox(
                  width: mediaQuery.size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: LargeButton(
                      child: state.loading
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
                      elevation: 6,
                      onPressed: () => save(state.user),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
