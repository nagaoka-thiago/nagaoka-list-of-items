import 'package:flutter_modular/flutter_modular.dart';

import '../../data/repositories/database_repository.dart';
import '../entities/item_entity.dart';

abstract class GetItemsEntityUsecase {
  Future<List<ItemEntity>> call();
}

class DefaultGetItemsEntityUsecase implements GetItemsEntityUsecase {
  final repository = Modular.get<DatabaseRepository>();
  @override
  Future<List<ItemEntity>> call() async{
    return await repository.getItemsEntity();
  }
}