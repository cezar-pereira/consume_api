import 'package:consume_api/app/modules/login/domain/entities/login_credentials.dart';
import 'package:consume_api/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginDatasourceMock extends Mock implements LoginDataSourceInterface {}

void main() {
  late LoginDataSourceInterface datasource;
  late LoginCredential credential;
  setUpAll(() {
    datasource = LoginDatasourceMock();
    credential = LoginCredential.withEmailAndPassword(email: '', password: '');
  });
  group('loginWithEmail', () {
    test('Should return TRUE', () async {
      when(() => datasource.loginWithEmail(credential: credential))
          .thenAnswer((_) async => true);
      var result = await datasource.loginWithEmail(credential: credential);
      expect(result, true);
    });
  });
  group('logout', () {
    test('Should return TRUE', () async {
      when(() => datasource.logout()).thenAnswer((_) async => true);
      var result = await datasource.logout();
      expect(result, true);
    });
  });
}
