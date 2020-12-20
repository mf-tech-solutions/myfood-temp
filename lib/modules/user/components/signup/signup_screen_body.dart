import 'package:flutter/material.dart';

import '../../../../components/inputs/text_field.dart';
import '../auth_screen_image.dart';
import '../form_submit_button.dart';
import 'signup_form.dart';

class SignUpScreenBody extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final ValidationCallback validateEmail;
  final ValidationCallback validatePassword;
  final FunctionWithContext onSubmit;

  SignUpScreenBody({
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
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 256,
                    child: AuthScreenImage(),
                  ),
                  SignUpForm(
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
