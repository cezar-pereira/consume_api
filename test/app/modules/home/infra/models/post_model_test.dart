import 'package:consume_api/app/modules/home/infra/models/post_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> data = {
    'id': 1,
    'title': 'mockTitle',
    'body': 'mockBody'
  };

  test('Should create a PostModel', () {
    PostModel postModel = PostModel.fromMap(map: data);
    expect(postModel, isA<PostModel>());
  });
}
