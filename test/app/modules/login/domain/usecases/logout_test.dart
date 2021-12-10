import 'package:consume_api/app/modules/login/domain/errors/errors.dart';
import 'package:consume_api/app/modules/login/domain/repositories/login_repository.dart';
import 'package:consume_api/app/modules/login/domain/usecases/logout.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepositoryInterface {}

void main() {
  late LoginRepositoryInterface repo;
  late LogoutInterface usecase;

  setUpAll(() {
    repo = LoginRepositoryMock();
    usecase = LogoutUsecase(repository: repo);
  });

  test('Should return TRUE', () async {
    when(() => repo.logout()).thenAnswer((_) async => const Right(true));
    var result = await usecase();
    expect(result, const Right(true));
  });
  test('Should return FailureInterface', () async {
    var error = ErrorLogout(message: 'error');
    when(() => repo.logout()).thenAnswer((_) async => Left(error));
    var result = await usecase();
    expect(result, Left(error));
  });
}
