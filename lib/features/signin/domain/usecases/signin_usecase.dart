
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/repositories/signin_repository.dart';

abstract class SigninUsecase {
  Future<bool> call();
}

class DefaultSigninUsecase implements SigninUsecase {
  final _repository = Modular.get<SigninRepository>();
  @override
  Future<bool> call() async{
    return await _repository.signin();
  }
}