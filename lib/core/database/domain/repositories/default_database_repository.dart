import 'package:flutter_modular/flutter_modular.dart';

import '../../data/data_sources/database_data_source.dart';
import '../../data/repositories/database_repository.dart';
import '../entities/item_entity.dart';

class DefaultDatabaseRepository implements DatabaseRepository {
  final datasource = Modular.get<DatabaseDataSource>();
  @override
  Future<bool> deleteItemEntity(ItemEntity itemEntity) async{
    return await datasource.deleteItemEntity(itemEntity);
  }

  @override
  Future<List<ItemEntity>> getItemEntityByTitle(String title) async{
   return await datasource.getItemEntityByTitle(title);
  }

  @override
  Future<List<ItemEntity>> getItemsEntity() async{
    return await datasource.getItemsEntity();
  }

  @override
  Future<bool> writeItemEntity(ItemEntity itemEntity) async{
    return await datasource.writeItemEntity(itemEntity);
  }

  @override
  Future<bool> writeItemsEntity(List<ItemEntity> itemsEntity) async{
    return await datasource.writeItemsEntity(itemsEntity);
  }

}