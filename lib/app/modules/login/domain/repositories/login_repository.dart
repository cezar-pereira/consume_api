import 'package:consume_api/app/modules/login/domain/entities/login_credentials.dart';
import 'package:consume_api/app/modules/login/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepositoryInterface {
  Future<Either<FailureInterface, bool>> loginWithEmail(
      {required LoginCredential credential});

  Future<Either<FailureInterface, bool>> logout();
}
