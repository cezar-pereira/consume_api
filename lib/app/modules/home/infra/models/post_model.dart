import 'package:consume_api/app/modules/home/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({String id = '', required String title, required String body})
      : super(title: title, body: body, id: id);

  factory PostModel.fromMap({required Map<String, dynamic> map}) => PostModel(
        id: map['id'].toString(),
        title: map['title'],
        body: map['body'],
      );
}
