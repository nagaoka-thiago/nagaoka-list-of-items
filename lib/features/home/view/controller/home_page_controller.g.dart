// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageController on _HomePageController, Store {
  late final _$itemsAtom =
      Atom(name: '_HomePageController.items', context: context);

  @override
  ObservableList<ItemEntity> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ItemEntity> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomePageController.isLoading', context: context);

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

  late final _$initializeListAsyncAction =
      AsyncAction('_HomePageController.initializeList', context: context);

  @override
  Future<void> initializeList() {
    return _$initializeListAsyncAction.run(() => super.initializeList());
  }

  late final _$deleteItemAsyncAction =
      AsyncAction('_HomePageController.deleteItem', context: context);

  @override
  Future<bool> deleteItem(ItemEntity itemEntity) {
    return _$deleteItemAsyncAction.run(() => super.deleteItem(itemEntity));
  }

  late final _$signoutAsyncAction =
      AsyncAction('_HomePageController.signout', context: context);

  @override
  Future<bool> signout() {
    return _$signoutAsyncAction.run(() => super.signout());
  }

  late final _$_HomePageControllerActionController =
      ActionController(name: '_HomePageController', context: context);

  @override
  void changeIsLoading(bool newVal) {
    final _$actionInfo = _$_HomePageControllerActionController.startAction(
        name: '_HomePageController.changeIsLoading');
    try {
      return super.changeIsLoading(newVal);
    } finally {
      _$_HomePageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
isLoading: ${isLoading}
    ''';
  }
}
