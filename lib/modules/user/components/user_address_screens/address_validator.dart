class AddressValidator {
  final String street;
  final String streetNumber;
  final String zipCode;

  String validationMessage = '';

  AddressValidator(this.street, this.streetNumber, this.zipCode);

  void validate() {
    if (street.isEmpty) {
      validationMessage = 'Informe a rua.';
    } else if (streetNumber.isEmpty) {
      validationMessage = 'Informe o número.';
    } else if (zipCode.isEmpty) {
      validationMessage = 'Informe o CEP.';
    } else if (zipCode.length < 8) {
      validationMessage = 'CEP deve conter 8 dígitos';
    }
  }
}
