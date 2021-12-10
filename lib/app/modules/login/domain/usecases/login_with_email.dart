import 'package:consume_api/app/modules/login/domain/entities/login_credentials.dart';
import 'package:consume_api/app/modules/login/domain/errors/errors.dart';
import 'package:consume_api/app/modules/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LoginWithEmailInterface {
  Future<Either<FailureInterface, bool>> call(
      {required LoginCredential credential});
}

class LoginWithEmail implements LoginWithEmailInterface {
  final LoginRepositoryInterface repository;

  LoginWithEmail({required this.repository});
  @override
  Future<Either<FailureInterface, bool>> call(
      {required LoginCredential credential}) async {
    if (!credential.isValidEmail) {
      return Left(ErrorLoginWithEmail(message: "E-mail inválido"));
    } else if (!credential.isValidPassword) {
      return Left(ErrorLoginWithEmail(message: "Senha inválida"));
    }

    return await repository.loginWithEmail(credential: credential);
  }
}
