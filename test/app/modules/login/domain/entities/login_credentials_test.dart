import 'package:consume_api/app/modules/login/domain/entities/login_credentials.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LoginCredential credential;

  setUpAll(() {
    credential = LoginCredential.withEmailAndPassword(email: '', password: '');
  });

  group('withEmailAndPassword:', () {
    test('Should return true when e-mail is valid', () {
      var result = credential.isValidEmail;
      expect(result, true);
    });
    test('Should return true when password is valid', () {
      var result = credential.isValidPassword;
      expect(result, true);
    });
  });
}
