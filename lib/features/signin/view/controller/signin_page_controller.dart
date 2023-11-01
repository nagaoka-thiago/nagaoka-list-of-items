// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/is_signed_in_usecase.dart';
import '../../domain/usecases/signin_usecase.dart';

part 'signin_page_controller.g.dart';

class SigninPageController = _SigninPageController with _$SigninPageController;

abstract class _SigninPageController with Store {
  final signinUsecase = Modular.get<SigninUsecase>();
  final isSignedInUsecase = Modular.get<IsSignedInUsecase>();

  @observable
  String displayName = '';

  @observable
  bool isLoading = false;

  @action
  void changeIsLoading(bool newVal) {
    isLoading = newVal;
  }

  @action
  void changeDisplayName(String newValue) {
    displayName = newValue;
  }

  @action
  Future<bool> signin() async{
    return await signinUsecase();
  }

  @action
  Future<bool> isSignedIn() async {
    final result = await isSignedInUsecase();

    changeDisplayName(result ?? '');

    return result != null;
  }
}