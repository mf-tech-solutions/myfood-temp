class UserResource {
  //region reset password
  static get resetPasswordInstruction =>
      'Informe abaixo o email para redefinição de senha.';

  static get resetPasswordAlertTitle => 'Redefinir senha';
  //endregion

  static get invalidEmail => 'Email inválido.';

  static get invalidEmailAndPassword => 'Email e senha inválidos.';

  static get userAlreadyExists =>
      'Já existe um usuário com esse nome/email/telefone.';

  static get signedIn => 'Bem-vindo!';

  static get emailHintText => 'Email';

  static get emailRequired => 'Email é obrigatório';

  static get passwordHintText => 'Senha';

  static get passwordRequired => 'Senha é obrigatória';

  static String get forgotPassword => 'Esqueci minha senha';

  static String get sign => 'Entrar';

  static String get noAccount => 'Não possui conta?';

  static String get signUpFormButton => 'Cadastrar';

  static String get signUp => 'Cadastre-se';

  static String get hasAccount => 'Já possui conta?';

  static String get signOut => 'Sair';
}
