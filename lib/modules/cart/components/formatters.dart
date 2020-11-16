import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CpfFormatter extends MaskTextInputFormatter {
  CpfFormatter({
    String initialText,
  }) : super(mask: '###.###.###-##');
}

class CreditCardLastDigitsFormatter extends MaskTextInputFormatter {
  CreditCardLastDigitsFormatter(
    String cardLastDigits,
  ) : super(mask: '**** ####');
}
