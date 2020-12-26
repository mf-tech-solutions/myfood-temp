import 'package:flutter/material.dart';

import '../../../../components/inputs/text_field.dart';
import '../auth_screen_image.dart';
import '../form_submit_button.dart';
import 'login_form.dart';

class LoginScreenBody extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final ValidationCallback validateEmail;
  final ValidationCallback validatePassword;
  final FunctionWithContext onSubmit;

  LoginScreenBody({
    @required this.emailController,
    @required this.passwordController,
    @required this.validateEmail,
    @required this.validatePassword,
    @required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      child: OrientationBuilder(
        builder: (context, orientation) {
          final formContainerWidth =
              size.width * (orientation == Orientation.portrait ? 1 : 0.5);
          final imageSize = 240.0;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'app_logo',
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: imageSize,
                        maxWidth: imageSize,
                      ),
                      child: AuthScreenImage(),
                    ),
                  ),
                  LoginForm(
                    width: formContainerWidth,
                    emailController: this.emailController,
                    passwordController: this.passwordController,
                    validateEmail: this.validateEmail,
                    validatePassword: this.validatePassword,
                    onSubmit: this.onSubmit,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
