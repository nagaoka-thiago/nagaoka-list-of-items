// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nagaoka_list_items/core/database/domain/entities/item_entity.dart';

import '../../../../core/database/domain/usecases/write_item_entity_usecase.dart';

part 'form_page_controller.g.dart';

class FormPageController = _FormPageController with _$FormPageController;

abstract class _FormPageController with Store {
  final writeItemUsecase = Modular.get<WriteItemEntityUsecase>();

  @observable
  String? title;

  @observable
  String? description;

  @observable
  double? price;

  @observable
  int? quantity;

  @observable
  ItemEntity? itemToEdit;

  @action
  void setTitle(String newVal){
    title = newVal;
  }

  @action
  void setDescription(String newVal){
    description = newVal;
  }

  @action
  void setPrice(double newVal){
    price = newVal;
  }

  @action
  void setQuantity(int newVal){
    quantity = newVal;
  }

  @action
  void setItemToEdit(ItemEntity? newVal) {
    itemToEdit = newVal;
  }

  @action
  Future<bool> writeToIsa() async{
    if(title == null || title!.isEmpty) return false;
    if(description == null || description!.isEmpty) return false;
    if(price == null) return false;
    if(quantity == null) return false;

    if(itemToEdit == null) {
      final newEntity = ItemEntity()
                          ..description = description
                          ..price = price
                          ..quantity = quantity
                          ..title = title;
      await writeItemUsecase(newEntity);

      return true;
    }

    itemToEdit!..description = description
                          ..price = price
                          ..quantity = quantity
                          ..title = title;

    await writeItemUsecase(itemToEdit!);

    return true;
  }
}