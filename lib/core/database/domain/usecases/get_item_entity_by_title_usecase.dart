import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_list_items/core/database/domain/entities/item_entity.dart';

import '../../data/repositories/database_repository.dart';

abstract class GetItemEntityByTitleUsecase {
  Future<List<ItemEntity>> call(String title);
}

class DefaultGetItemEntityByTitleUsecase implements GetItemEntityByTitleUsecase {
  final repository = Modular.get<DatabaseRepository>();
  @override
  Future<List<ItemEntity>> call(String title) async{
    return await repository.getItemEntityByTitle(title);
  }
}