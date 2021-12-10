abstract class FailureInterface implements Exception {
  String get message;
}

class ErrorLoginWithEmail extends FailureInterface {
  @override
  final String message;
  ErrorLoginWithEmail({required this.message});
}

class ErrorLogout extends FailureInterface {
  @override
  final String message;
  ErrorLogout({required this.message});
}
