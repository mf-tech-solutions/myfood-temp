import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CpfFormatter extends MaskTextInputFormatter {
  CpfFormatter({
    String initialText,
  }) : super(mask: '###.###.###-##');
}

class UserCardFormatter extends MaskTextInputFormatter {
  UserCardFormatter() : super(mask: '#### #### #### ####');
}

class UserCardLastDigitsFormatter extends MaskTextInputFormatter {
  UserCardLastDigitsFormatter() : super(mask: '**** ####');
}

class UserCardDueDateFormatter extends MaskTextInputFormatter {
  UserCardDueDateFormatter() : super(mask: '##/##');
}
