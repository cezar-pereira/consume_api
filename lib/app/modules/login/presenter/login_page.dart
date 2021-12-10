import 'package:consume_api/app/modules/login/presenter/functions/credentials_validations.dart';
import 'package:consume_api/app/shared/components/snackbar_error_custom_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'components/text_field_login_password_component.dart';
import 'components/text_field_login_user_component.dart';
import 'login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginCubit> {
  final _formKey = GlobalKey<FormState>();
  final validation = CredentialsValidations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: store,
        builder: (context, state) {
          if (state is LoginSuccessState) {
            Modular.to.pushReplacementNamed('/home/');
          }

          if (state is LoginErrorState) showError(error: state.error.message);

          return Container(
            height: double.maxFinite,
            color: Theme.of(context).backgroundColor,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 100),
                    child: const Text('LOGO'),
                  ),
                  const SizedBox(height: 180),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFieldLoginUserComponent(
                            validation: validation.email,
                            onChanged: (value) {
                              store.controllerEmail.text = value;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFieldLoginPasswordComponent(
                              validation: validation.password,
                              onSubmitted: () async {
                                if (_formKey.currentState!.validate()) {
                                  await store.loginWithEmail();
                                }
                              },
                              onChanged: (value) {
                                store.controllerPassword.text = value;
                              }),
                          const SizedBox(height: 80),
                          ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await store.loginWithEmail();
                                }
                              },
                              child: const Text('ENTRAR'))
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('E-mail: 3 caracteres ou vazio'),
                      Text('Senha: 3 caracteres ou vazia'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  showError({required String error}) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      SnackBarErrorCustom(context: context, error: error).call();
    });
  }
}
