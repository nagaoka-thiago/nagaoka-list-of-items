
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/repositories/signin_repository.dart';

abstract class SignoutUsecase {
  Future<bool> call();
}

class DefaultSignoutUsecase implements SignoutUsecase {
  final _repository = Modular.get<SigninRepository>();
  @override
  Future<bool> call() async{
    return await _repository.signout();
  }
}