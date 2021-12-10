import 'package:consume_api/app/modules/home/domain/entities/post_entity.dart';
import 'package:consume_api/app/modules/home/domain/errors/errors.dart';
import 'package:consume_api/app/modules/home/domain/repositories/post_repository.dart';
import 'package:consume_api/app/modules/home/infra/datasources/post_datasource.dart';
import 'package:dartz/dartz.dart';

class PostRepository implements PostRepositoryInterface {
  final PostDataSourceInterface datasource;

  PostRepository({required this.datasource});
  @override
  Future<Either<FailureInterface, List<PostEntity>>> fetchPosts() async {
    try {
      var result = await datasource.fetchPost();
      return Right(result);
    } catch (e) {
      return Left(ErrorFetchPostsEntity(message: e.toString()));
    }
  }
}
