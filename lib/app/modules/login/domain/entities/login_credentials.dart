class LoginCredential {
  final String email;
  final String password;

  LoginCredential({required this.email, required this.password});

  bool get isValidEmail => true; //fake
  bool get isValidPassword => true; //fake

  factory LoginCredential.withEmailAndPassword(
      {required String email, required String password}) {
    return LoginCredential(email: email, password: password);
  }
}
