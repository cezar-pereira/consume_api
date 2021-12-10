// ignore_for_file: prefer_const_constructors

import 'package:consume_api/app/modules/home/presenter/components/card_post.dart';
import 'package:consume_api/app/modules/login/presenter/logout_cubit.dart';
import 'package:consume_api/app/shared/components/snackbar_error_custom_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'fetch_posts_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, FetchPostsCubit> {
  @override
  void initState() {
    store.fetchPost();
    super.initState();
  }

  @override
  void dispose() {
    store.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          BlocBuilder(
            bloc: Modular.get<LogoutCubit>(),
            builder: (context, state) {
              if (state is LogoutErrorState) {
                showError(error: state.error.message);
              }

              if (state is LogoutSuccessState) {
                Modular.to.pushReplacementNamed('/');
              }

              return TextButton(
                onPressed: () {
                  Modular.get<LogoutCubit>().call();
                },
                child: Text('SAIR', style: TextStyle(color: Colors.black)),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder(
        bloc: store,
        builder: (context, state) {
          if (state is FetchPostStateLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (state is FetchProductsStateError) {
            showError(error: state.error.message);
            return Container();
          }

          state as FetchProductsStateSuccess;
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              // return Text(state.data[index].title);
              return CardPostComponent(post: state.data[index]);
            },
            separatorBuilder: (context, index) => SizedBox(height: 20),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        store.fetchPost();
      }),
    );
  }

  showError({required String error}) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      SnackBarErrorCustom(context: context, error: error).call();
    });
  }
}
