import 'package:flutter_modular/flutter_modular.dart';

import 'core/database/data/data_sources/database_data_source.dart';
import 'core/database/data/repositories/database_repository.dart';
import 'core/database/domain/data_sources/default_database_data_source.dart';
import 'core/database/domain/repositories/default_database_repository.dart';
import 'features/signin/data/data_sources/signin_data_source.dart';
import 'features/signin/data/repositories/signin_repository.dart';
import 'features/signin/domain/data_sources/default_signin_data_source.dart';
import 'features/signin/domain/repositories/default_signin_repository.dart';
import 'features/signin/signin_module.dart';
import 'features/form/form_module.dart';
import 'features/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    Bind<DatabaseDataSource>((i) => DefaultDatabaseDataSource(),),
    Bind<DatabaseRepository>((i) => DefaultDatabaseRepository(),),

    Bind<SigninDataSource>((i) => DefaultSigninDataSource()),
    Bind<SigninRepository>((i) => DefaultSigninRepository()),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: SigninModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/form', module: FormModule())
  ];
}