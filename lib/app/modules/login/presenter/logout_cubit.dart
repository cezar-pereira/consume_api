import 'package:consume_api/app/modules/login/domain/errors/errors.dart';
import 'package:consume_api/app/modules/login/domain/usecases/logout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LogoutCubitStateInterface {}

class LogoutEmptyState implements LogoutCubitStateInterface {}

class LogoutSuccessState implements LogoutCubitStateInterface {}

class LogoutErrorState implements LogoutCubitStateInterface {
  final FailureInterface error;
  LogoutErrorState({required this.error});
}

class LogoutCubit extends Cubit<LogoutCubitStateInterface> {
  LogoutCubit({required this.usecase}) : super(LogoutEmptyState());

  final LogoutInterface usecase;

  call() async {
    var result = await usecase();
    result.fold((error) {
      emit(LogoutErrorState(error: error));
    }, (r) {
      emit(LogoutSuccessState());
    });
  }
}
