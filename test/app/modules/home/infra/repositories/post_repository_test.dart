import 'package:consume_api/app/modules/home/domain/entities/post_entity.dart';
import 'package:consume_api/app/modules/home/domain/errors/errors.dart';
import 'package:consume_api/app/modules/home/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PostRepositoryMock extends Mock implements PostRepositoryInterface {}

void main() {
  late PostRepositoryInterface repository;
  setUpAll(() {
    repository = PostRepositoryMock();
  });
  test('Should return a List<PostEntity>', () async {
    List<PostEntity> list = [];
    when(() => repository.fetchPosts())
        .thenAnswer((invocation) async => Right(list));
    var result = await repository.fetchPosts();
    expect(result, Right(list));
  });
  test('Should return a ErrorFetchPostsEntity', () async {
    ErrorFetchPostsEntity error = ErrorFetchPostsEntity(message: 'error');
    when(() => repository.fetchPosts()).thenAnswer((_) async => Left(error));
    var result = await repository.fetchPosts();
    expect(result, Left(error));
  });
}
