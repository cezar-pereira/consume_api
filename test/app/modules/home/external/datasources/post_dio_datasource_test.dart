import 'package:consume_api/app/modules/home/infra/datasources/post_datasource.dart';
import 'package:consume_api/app/modules/home/infra/models/post_model.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PostDataSourceMock extends Mock implements PostDataSourceInterface {}

void main() {
  late PostDataSourceInterface datasource;

  setUpAll(() {
    datasource = PostDataSourceMock();
  });
  test('Should return a Future<List<PostModel>>', () {
    Future<List<PostModel>> list = Future.value([]);
    when(() => datasource.fetchPost()).thenAnswer((_) async => list);
    var result = datasource.fetchPost();
    expect(result, isA<Future<List<PostModel>>>());
  });
}
