import 'package:flutter/material.dart';

import 'forgot_password_check.dart';
import 'no_account_check.dart';
import '../form_container.dart';
import '../form_submit_button.dart';
import '../../auth_resource.dart';
import '../../../../components/inputs/text_field.dart';

class LoginForm extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController;
  final TextEditingController passwordController;

  final ValidationCallback validateEmail;
  final ValidationCallback validatePassword;
  final FunctionWithContext onSubmit;

  final double width;

  LoginForm({
    @required this.emailController,
    @required this.passwordController,
    @required this.validateEmail,
    @required this.validatePassword,
    @required this.width,
    @required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      width: this.width,
      child: Form(
        key: this.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyTextField(
              icon: Icons.email,
              isObscure: false,
              hintText: AuthResource.emailHintText,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 24),
            MyTextField(
              icon: Icons.lock,
              isObscure: true,
              hintText: AuthResource.passwordHintText,
              controller: passwordController,
            ),
            SizedBox(height: 12),
            ForgotPasswordCheck(),
            SizedBox(height: 16),
            FormSubmitButton(
              text: AuthResource.sign.toUpperCase(),
              onSubmit: this.onSubmit,
            ),
            SizedBox(height: 16),
            Divider(height: 36),
            NoAccountCheck(),
          ],
        ),
      ),
    );
  }
}
