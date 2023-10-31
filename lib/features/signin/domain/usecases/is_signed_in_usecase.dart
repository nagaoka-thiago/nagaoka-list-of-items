
import 'package:flutter_modular/flutter_modular.dart';

import '../../data/repositories/signin_repository.dart';

abstract class IsSignedInUsecase {
  Future<String?> call();
}

class DefaultIsSignedInUsecase implements IsSignedInUsecase {
  final _repository = Modular.get<SigninRepository>();
  @override
  Future<String?> call() async{
    return await _repository.isSignedIn();
  }
}