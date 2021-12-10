import 'package:consume_api/app/modules/home/domain/entities/post_entity.dart';
import 'package:consume_api/app/modules/home/domain/errors/errors.dart';
import 'package:consume_api/app/modules/home/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

abstract class FetchPostsUsecaseInterface {
  Future<Either<FailureInterface, List<PostEntity>>> call();
}

class FetchPostsUsecase implements FetchPostsUsecaseInterface {
  final PostRepositoryInterface repository;

  FetchPostsUsecase({required this.repository});
  @override
  Future<Either<FailureInterface, List<PostEntity>>> call() async {
    return await repository.fetchPosts();
  }
}
