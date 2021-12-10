import 'package:consume_api/app/modules/home/domain/repositories/post_repository.dart';
import 'package:consume_api/app/modules/home/domain/usecases/fetch_posts.dart';
import 'package:consume_api/app/modules/home/external/datasources/post_dio_datasource.dart';
import 'package:consume_api/app/modules/home/infra/datasources/post_datasource.dart';
import 'package:consume_api/app/modules/home/infra/repositories/post_repository.dart';
import 'package:consume_api/app/modules/login/presenter/login_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'fetch_posts_cubit.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        LoginModule(),
      ];
  @override
  final List<Bind> binds = [
    /*** CUBIT ***/
    Bind.lazySingleton(
        (i) => FetchPostsCubit(usecase: i.get<FetchPostsUsecaseInterface>())),

    /*** DATASOURCES  ***/
    Bind.lazySingleton((i) =>
        PostDataSource(url: 'https://jsonplaceholder.typicode.com/posts')),

    /*** REPOSITORIES  ***/
    Bind.lazySingleton(
        (i) => PostRepository(datasource: i.get<PostDataSourceInterface>())),

    /*** USECASES  ***/
    Bind.lazySingleton(
        (i) => FetchPostsUsecase(repository: i.get<PostRepositoryInterface>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (context, args) => const HomePage()),
  ];
}
