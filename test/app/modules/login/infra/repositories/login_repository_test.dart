import 'package:consume_api/app/modules/login/domain/entities/login_credentials.dart';
import 'package:consume_api/app/modules/login/domain/errors/errors.dart';
import 'package:consume_api/app/modules/login/domain/repositories/login_repository.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepositoryInterface {}

void main() {
  late LoginRepositoryInterface repo;
  late LoginCredential credential;
  setUpAll(() {
    repo = LoginRepositoryMock();
    credential = LoginCredential.withEmailAndPassword(email: '', password: '');
  });
  group('loginWithEmail', () {
    test('Should return TRUE', () async {
      when(() => repo.loginWithEmail(credential: credential))
          .thenAnswer((_) async => const Right(true));
      var result = await repo.loginWithEmail(credential: credential);
      expect(result, const Right(true));
    });
    test('Should return FailureInterface', () async {
      var error = ErrorLoginWithEmail(message: 'error');
      when(() => repo.loginWithEmail(credential: credential))
          .thenAnswer((_) async => Left(error));
      var result = await repo.loginWithEmail(credential: credential);
      expect(result, Left(error));
    });
  });
  group('logout', () {
    test('Should return TRUE', () async {
      when(() => repo.logout()).thenAnswer((_) async => const Right(true));
      var result = await repo.logout();
      expect(result, const Right(true));
    });
    test('Should return FailureInterface', () async {
      var error = ErrorLogout(message: 'error');
      when(() => repo.logout()).thenAnswer((_) async => Left(error));
      var result = await repo.logout();
      expect(result, Left(error));
    });
  });
}
