import 'package:consume_api/app/modules/home/domain/entities/post_entity.dart';
import 'package:consume_api/app/modules/home/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepositoryInterface {
  Future<Either<FailureInterface, List<PostEntity>>> fetchPosts();
}
