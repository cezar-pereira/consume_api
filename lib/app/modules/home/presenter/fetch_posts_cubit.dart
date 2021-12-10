import 'package:consume_api/app/modules/home/domain/entities/post_entity.dart';
import 'package:consume_api/app/modules/home/domain/errors/errors.dart';
import 'package:consume_api/app/modules/home/domain/usecases/fetch_posts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class FetchPostState {}

class FetchProductsStateSuccess implements FetchPostState {
  final List<PostEntity> data;
  FetchProductsStateSuccess({required this.data});
}

class FetchPostStateLoading implements FetchPostState {}

class FetchProductsStateError implements FetchPostState {
  final FailureInterface error;
  FetchProductsStateError({required this.error});
}

class FetchPostsCubit extends Cubit<FetchPostState> {
  FetchPostsCubit({required this.usecase}) : super(FetchPostStateLoading());

  final FetchPostsUsecaseInterface usecase;

  Future fetchPost() async {
    var result = await usecase.call();

    result.fold((error) {
      emit(FetchProductsStateError(error: error));
    }, (posts) {
      emit(FetchProductsStateSuccess(data: posts));
    });
  }
}
