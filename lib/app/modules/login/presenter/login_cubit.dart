import 'package:consume_api/app/modules/login/domain/entities/login_credentials.dart';
import 'package:consume_api/app/modules/login/domain/errors/errors.dart';
import 'package:consume_api/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginState {}

class LoginEmptyState implements LoginState {}

class LoginSuccessState implements LoginState {}

class LoginErrorState implements LoginState {
  final FailureInterface error;
  LoginErrorState({required this.error});
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.usecase}) : super(LoginEmptyState());

  final LoginWithEmailInterface usecase;

  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();

  loginWithEmail() async {
    var credential = LoginCredential.withEmailAndPassword(
        email: controllerEmail.text, password: controllerPassword.text);
    var result = await usecase(credential: credential);
    result.fold((error) {
      emit(LoginErrorState(error: error));
    }, (r) {
      emit(LoginSuccessState());
    });
  }
}
