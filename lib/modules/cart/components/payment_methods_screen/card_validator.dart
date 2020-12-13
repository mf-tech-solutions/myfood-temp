class CardValidator {
  final String cardNumber;
  final String cardCvv;
  final String cardDueDate;
  final String cardHolderName;
  final String cardHolderSocialId;

  String validationMessage = '';

  CardValidator(
    this.cardNumber,
    this.cardCvv,
    this.cardDueDate,
    this.cardHolderName,
    this.cardHolderSocialId,
  );

  void validate() {
    if (cardNumber.isEmpty) {
      validationMessage = 'Informe o número do cartão.';
    } else if (cardNumber.length < 16) {
      validationMessage = 'Número do cartão deve conter 16 dígitos';
    } else if (cardCvv.isEmpty) {
      validationMessage = 'Informe o código de segurança do cartão.';
    } else if (cardCvv.length < 3) {
      validationMessage = 'Código de segurança do cartão deve conter 3 dígitos';
    } else if (cardDueDate.isEmpty) {
      validationMessage = 'Informe a data de vencimento do cartão.';
    } else if (cardDueDate.length < 5) {
      validationMessage =
          'Data de vencimento do cartão deve conter 5 dígitos. (\'\\\' inclusa)';
    } else if (cardHolderName.isEmpty) {
      validationMessage = 'Informe o nome do titular do cartão.';
    } else if (cardHolderSocialId.isEmpty) {
      validationMessage = 'Informe o CPF do titular do cartão.';
    } else if (cardHolderSocialId.isEmpty) {
      validationMessage = 'O CPF deve conter 15 dígitos. (pontuação inclusa)';
    }
  }
}
