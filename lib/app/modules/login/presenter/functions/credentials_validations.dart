class CredentialsValidations {
  String? email(String value) {
    //fake
    return (value.length == 3) || value.isEmpty ? null : 'E-mail inválido';
  }

  String? password(String value) {
    //fake
    return (value.length == 3) || value.isEmpty ? null : 'Senha inválida';
  }
}
