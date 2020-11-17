import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CpfFormatter extends MaskTextInputFormatter {
  CpfFormatter({
    String initialText,
  }) : super(mask: '###.###.###-##');
}

class UserCardLastDigitsFormatter extends MaskTextInputFormatter {
  UserCardLastDigitsFormatter() : super(mask: '**** ####');
}
