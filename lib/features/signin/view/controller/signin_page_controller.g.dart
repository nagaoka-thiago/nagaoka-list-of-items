// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SigninPageController on _SigninPageController, Store {
  late final _$displayNameAtom =
      Atom(name: '_SigninPageController.displayName', context: context);

  @override
  String get displayName {
    _$displayNameAtom.reportRead();
    return super.displayName;
  }

  @override
  set displayName(String value) {
    _$displayNameAtom.reportWrite(value, super.displayName, () {
      super.displayName = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_SigninPageController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$signinAsyncAction =
      AsyncAction('_SigninPageController.signin', context: context);

  @override
  Future<bool> signin() {
    return _$signinAsyncAction.run(() => super.signin());
  }

  late final _$isSignedInAsyncAction =
      AsyncAction('_SigninPageController.isSignedIn', context: context);

  @override
  Future<bool> isSignedIn() {
    return _$isSignedInAsyncAction.run(() => super.isSignedIn());
  }

  late final _$_SigninPageControllerActionController =
      ActionController(name: '_SigninPageController', context: context);

  @override
  void changeIsLoading(bool newVal) {
    final _$actionInfo = _$_SigninPageControllerActionController.startAction(
        name: '_SigninPageController.changeIsLoading');
    try {
      return super.changeIsLoading(newVal);
    } finally {
      _$_SigninPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDisplayName(String newValue) {
    final _$actionInfo = _$_SigninPageControllerActionController.startAction(
        name: '_SigninPageController.changeDisplayName');
    try {
      return super.changeDisplayName(newValue);
    } finally {
      _$_SigninPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
displayName: ${displayName},
isLoading: ${isLoading}
    ''';
  }
}
