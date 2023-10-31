// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/database/domain/entities/item_entity.dart';
import '../../../../core/database/domain/usecases/delete_item_entity_usecase.dart';
import '../../../../core/database/domain/usecases/get_items_entity_usecase.dart';
import '../../../signin/domain/usecases/signout_usecase.dart';

part 'home_page_controller.g.dart';

class HomePageController = _HomePageController with _$HomePageController;

abstract class _HomePageController with Store {
  final getItemsUsecase = Modular.get<GetItemsEntityUsecase>();
  final deleteItemUsecase = Modular.get<DeleteItemEntityUsecase>();
  final signoutUsecase = Modular.get<SignoutUsecase>();
  

  @observable
  ObservableList<ItemEntity> items = <ItemEntity>[].asObservable();

  @action
  Future<void> initializeList() async{
    items = ObservableList.of(await getItemsUsecase());
  }

  @action
  Future<bool> deleteItem(ItemEntity itemEntity) async{
    return await deleteItemUsecase(itemEntity);
  }

  @action
  Future<bool> signout() async {
    return signoutUsecase();
  }
}