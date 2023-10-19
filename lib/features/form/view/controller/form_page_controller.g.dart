// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormPageController on _FormPageController, Store {
  late final _$titleAtom =
      Atom(name: '_FormPageController.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_FormPageController.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$priceAtom =
      Atom(name: '_FormPageController.price', context: context);

  @override
  double? get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double? value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: '_FormPageController.quantity', context: context);

  @override
  int? get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int? value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$itemToEditAtom =
      Atom(name: '_FormPageController.itemToEdit', context: context);

  @override
  ItemEntity? get itemToEdit {
    _$itemToEditAtom.reportRead();
    return super.itemToEdit;
  }

  @override
  set itemToEdit(ItemEntity? value) {
    _$itemToEditAtom.reportWrite(value, super.itemToEdit, () {
      super.itemToEdit = value;
    });
  }

  late final _$writeToIsaAsyncAction =
      AsyncAction('_FormPageController.writeToIsa', context: context);

  @override
  Future<bool> writeToIsa() {
    return _$writeToIsaAsyncAction.run(() => super.writeToIsa());
  }

  late final _$_FormPageControllerActionController =
      ActionController(name: '_FormPageController', context: context);

  @override
  void setTitle(String newVal) {
    final _$actionInfo = _$_FormPageControllerActionController.startAction(
        name: '_FormPageController.setTitle');
    try {
      return super.setTitle(newVal);
    } finally {
      _$_FormPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String newVal) {
    final _$actionInfo = _$_FormPageControllerActionController.startAction(
        name: '_FormPageController.setDescription');
    try {
      return super.setDescription(newVal);
    } finally {
      _$_FormPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(double newVal) {
    final _$actionInfo = _$_FormPageControllerActionController.startAction(
        name: '_FormPageController.setPrice');
    try {
      return super.setPrice(newVal);
    } finally {
      _$_FormPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(int newVal) {
    final _$actionInfo = _$_FormPageControllerActionController.startAction(
        name: '_FormPageController.setQuantity');
    try {
      return super.setQuantity(newVal);
    } finally {
      _$_FormPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItemToEdit(ItemEntity? newVal) {
    final _$actionInfo = _$_FormPageControllerActionController.startAction(
        name: '_FormPageController.setItemToEdit');
    try {
      return super.setItemToEdit(newVal);
    } finally {
      _$_FormPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
price: ${price},
quantity: ${quantity},
itemToEdit: ${itemToEdit}
    ''';
  }
}
