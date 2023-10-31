import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/is_signed_in_usecase.dart';
import 'domain/usecases/signin_usecase.dart';
import 'view/controller/signin_page_controller.dart';
import 'view/pages/signin_page.dart';

class SigninModule extends Module {
  @override
  List<Bind> get binds => [
    Bind<SigninUsecase>((i) => DefaultSigninUsecase()),
    Bind<IsSignedInUsecase>((i) => DefaultIsSignedInUsecase()),
    Bind<SigninPageController>((i) => SigninPageController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SigninPage())
  ];
}