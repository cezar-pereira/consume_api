import 'package:consume_api/app/modules/home/infra/models/post_model.dart';

abstract class PostDataSourceInterface {
  Future<List<PostModel>> fetchPost();
}
