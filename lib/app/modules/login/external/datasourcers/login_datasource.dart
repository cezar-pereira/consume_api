import 'package:consume_api/app/modules/login/domain/entities/login_credentials.dart';
import 'package:consume_api/app/modules/login/infra/datasources/login_datasource.dart';

class LoginDatasource implements LoginDataSourceInterface {
  @override
  Future<bool> loginWithEmail({required LoginCredential credential}) async {
    return true;
    // throw Exception('Error Fake');
  }

  @override
  Future<bool> logout() async {
    return true;
    // throw Exception('Error Fake');
  }
}
