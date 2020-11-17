import 'package:flutter/material.dart';
import '../../../components/inputs/text_field.dart';
import '../resource.dart';

class ResetPasswordAlert extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AuthResource.resetPasswordAlertTitle),
      insetPadding: const EdgeInsets.all(16),
      actionsPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'CANCELAR',
            style: TextStyle(color: Colors.black87),
          ),
        ),
        RaisedButton(
          onPressed: () {},
          child: Text('ENVIAR'),
          textColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AuthResource.resetPasswordInstruction),
            SizedBox(height: 16),
            MyTextField(
              controller: emailController,
              icon: Icons.email,
              isObscure: false,
              hintText: AuthResource.emailHintText,
            ),
          ],
        ),
      ),
    );
  }
}
