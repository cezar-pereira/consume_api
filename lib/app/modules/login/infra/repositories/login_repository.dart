import 'package:consume_api/app/modules/login/domain/entities/login_credentials.dart';
import 'package:consume_api/app/modules/login/domain/errors/errors.dart';
import 'package:consume_api/app/modules/login/domain/repositories/login_repository.dart';
import 'package:consume_api/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:dartz/dartz.dart';

class LoginRepository implements LoginRepositoryInterface {
  final LoginDataSourceInterface dataSource;

  LoginRepository({required this.dataSource});

  @override
  Future<Either<FailureInterface, bool>> loginWithEmail(
      {required LoginCredential credential}) async {
    try {
      var result = await dataSource.loginWithEmail(credential: credential);
      return Right(result);
    } catch (e) {
      return Left(ErrorLoginWithEmail(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureInterface, bool>> logout() async {
    try {
      var result = await dataSource.logout();
      return Right(result);
    } catch (e) {
      return Left(ErrorLogout(message: e.toString()));
    }
  }
}
