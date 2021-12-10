import 'package:consume_api/app/modules/home/infra/datasources/post_datasource.dart';
import 'package:consume_api/app/modules/home/infra/models/post_model.dart';
import 'package:dio/dio.dart';

import 'dart:developer' as dev;

class PostDataSource implements PostDataSourceInterface {
  final String url;

  PostDataSource({required this.url});
  @override
  Future<List<PostModel>> fetchPost() async {
    try {
      final response = await Dio().get(url);
      return response.data.map<PostModel>((post) {
        return PostModel.fromMap(map: post);
      }).toList();
    } on DioError catch (e, s) {
      dev.log(e.toString(), stackTrace: s);
      String error = 'Error';
      if (e.type == DioErrorType.connectTimeout) {
        error = 'Problema na conexão.';
      } else if (e.type == DioErrorType.cancel) {
        error = 'Operação cancelada.';
      } else {
        error = 'Erro no servidor.';
      }

      throw Exception(error);
    } catch (e, s) {
      dev.log(e.toString(), stackTrace: s);
      throw Exception(e.toString());
    }
  }
}
