import 'package:consume_api/app/modules/login/presenter/logout_cubit.dart';
import 'package:consume_api/app/modules/login/domain/repositories/login_repository.dart';
import 'package:consume_api/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:consume_api/app/modules/login/domain/usecases/logout.dart';
import 'package:consume_api/app/modules/login/external/datasourcers/login_datasource.dart';
import 'package:consume_api/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:consume_api/app/modules/login/infra/repositories/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';
import 'login_cubit.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    /*** CUBIT ***/
    Bind.lazySingleton(
        (i) => LoginCubit(usecase: i.get<LoginWithEmailInterface>()),
        export: true),
    Bind.lazySingleton((i) => LogoutCubit(usecase: i.get<LogoutInterface>()),
        export: true),

    /*** DATASOURCES  ***/
    Bind.lazySingleton((i) => LoginDatasource(), export: true),

    /*** REPOSITORIES  ***/
    Bind.lazySingleton(
        (i) => LoginRepository(dataSource: i.get<LoginDataSourceInterface>()),
        export: true),

    /*** USECASES  ***/
    Bind.lazySingleton(
        (i) => LoginWithEmail(repository: i.get<LoginRepositoryInterface>()),
        export: true),
    Bind.lazySingleton(
        (i) => LogoutUsecase(repository: i.get<LoginRepositoryInterface>()),
        export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}
