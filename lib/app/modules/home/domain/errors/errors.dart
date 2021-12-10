abstract class FailureInterface implements Exception {
  String get message;
}

class ErrorFetchPostsEntity implements FailureInterface {
  @override
  final String message;
  ErrorFetchPostsEntity({required this.message});
}
