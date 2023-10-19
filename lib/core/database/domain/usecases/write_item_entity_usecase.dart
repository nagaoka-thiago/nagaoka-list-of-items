import 'package:flutter_modular/flutter_modular.dart';

import '../../data/repositories/database_repository.dart';
import '../entities/item_entity.dart';

abstract class WriteItemEntityUsecase {
  Future<bool> call(ItemEntity itemEntity);
}

class DefaultWriteItemEntityUsecase implements WriteItemEntityUsecase {
  final repository = Modular.get<DatabaseRepository>();
  @override
  Future<bool> call(ItemEntity itemEntity) async{
    return await repository.writeItemEntity(itemEntity);
  }
}