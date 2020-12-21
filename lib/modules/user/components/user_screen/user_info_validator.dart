class UserInfoValidator {
  final String username;
  final String socialId;
  final String phone;
  final String email;

  String validationMessage = '';

  UserInfoValidator(this.username, this.socialId, this.phone, this.email);

  void validate() {
    if (username.isEmpty) {
      validationMessage = 'Informe seu nome';
    } else if (socialId.isEmpty) {
      validationMessage = 'Informe seu CPF';
    } else if (socialId.length != 11) {
      validationMessage = 'CPF deve conter 11 dígitos (pontuação não inclusa)';
    } else if (phone.isEmpty) {
      validationMessage = 'Informe seu telofone';
    } else if (phone.length != 11) {
      validationMessage =
          'Telefone deve conter 11 dígitos (pontuação não inclusa)';
    } else if (!phone.contains('9')) {
      validationMessage = 'Telefone deve conter \'9\' após o DDD';
    } else if (email.isEmpty) {
      validationMessage = 'Informe seu e-mail';
    } else if (!email.contains('@')) {
      validationMessage = 'E-mail inválido';
    }
  }
}
