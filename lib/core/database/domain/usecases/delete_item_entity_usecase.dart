import 'package:flutter_modular/flutter_modular.dart';

import '../../data/repositories/database_repository.dart';
import '../entities/item_entity.dart';

abstract class DeleteItemEntityUsecase {
  Future<bool> call(ItemEntity itemEntity);
}

class DefaultDeleteItemEntityUsecase implements DeleteItemEntityUsecase {
  final repository = Modular.get<DatabaseRepository>();
  @override
  Future<bool> call(ItemEntity itemEntity) async{
    return await repository.deleteItemEntity(itemEntity);
  }
}