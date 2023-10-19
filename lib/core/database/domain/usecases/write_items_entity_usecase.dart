import 'package:flutter_modular/flutter_modular.dart';

import '../../data/repositories/database_repository.dart';
import '../entities/item_entity.dart';

abstract class WriteItemsEntityUsecase {
  Future<bool> call(List<ItemEntity> itemEntity);
}

class DefaultWriteItemsEntityUsecase implements WriteItemsEntityUsecase {
  final repository = Modular.get<DatabaseRepository>();
  @override
  Future<bool> call(List<ItemEntity> itemsEntity) async{
    return await repository.writeItemsEntity(itemsEntity);
  }
}