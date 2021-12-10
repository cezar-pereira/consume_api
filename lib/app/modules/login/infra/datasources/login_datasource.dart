import 'package:consume_api/app/modules/login/domain/entities/login_credentials.dart';

abstract class LoginDataSourceInterface {
  Future<bool> loginWithEmail({required LoginCredential credential});
  Future<bool> logout();
}
