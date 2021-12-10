import 'package:consume_api/app/modules/login/domain/errors/errors.dart';
import 'package:consume_api/app/modules/login/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

abstract class LogoutInterface {
  Future<Either<FailureInterface, bool>> call();
}

class LogoutUsecase implements LogoutInterface {
  final LoginRepositoryInterface repository;
  LogoutUsecase({required this.repository});

  @override
  Future<Either<FailureInterface, bool>> call() async {
    return await repository.logout();
  }
}
