import 'dart:io';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/data_sources/database_data_source.dart';
import '../entities/item_entity.dart';

class DefaultDatabaseDataSource implements DatabaseDataSource {
  Directory? dir;
  Isar? isar;

  @override
  Future<bool> deleteItemEntity(ItemEntity itemEntity) async{
    if(dir == null) {
      dir = await getApplicationDocumentsDirectory();
    }
    if(isar == null) {
      isar = await Isar.open([ItemEntitySchema], directory: dir!.path);
    }
    bool deleted = false;
    await isar!.writeTxn(() async{
      deleted = await isar!.itemEntitys.delete(itemEntity.id);
    });

    return deleted;
  }

  @override
  Future<List<ItemEntity>> getItemEntityByTitle(String title) async{
    if(dir == null) {
      dir = await getApplicationDocumentsDirectory();
    }
    if(isar == null) {
      isar = await Isar.open([ItemEntitySchema], directory: dir!.path);
    }

    return await isar!.itemEntitys.filter().titleContains(title).findAll();
  }

  @override
  Future<List<ItemEntity>> getItemsEntity() async{
    if(dir == null) {
      dir = await getApplicationDocumentsDirectory();
    }
    if(isar == null) {
      isar = await Isar.open([ItemEntitySchema], directory: dir!.path);
    }

    return await isar!.itemEntitys.where().findAll();
  }

  @override
  Future<bool> writeItemEntity(ItemEntity itemEntity) async{
    if(itemEntity.description == null || itemEntity.description!.isEmpty) return false;
    if(itemEntity.title == null || itemEntity.title!.isEmpty) return false;
    if(itemEntity.price == null) return false;
    if(itemEntity.quantity == null) return false;

    if(dir == null) {
      dir = await getApplicationDocumentsDirectory();
    }
    if(isar == null) {
      isar = await Isar.open([ItemEntitySchema], directory: dir!.path);
    }

    await isar!.writeTxn(() async{
      await isar!.itemEntitys.put(itemEntity);
    });

    return true;
  }

  @override
  Future<bool> writeItemsEntity(List<ItemEntity> itemsEntity) async{
    if(dir == null) {
      dir = await getApplicationDocumentsDirectory();
    }
    if(isar == null) {
      isar = await Isar.open([ItemEntitySchema], directory: dir!.path);
    }

    await isar!.writeTxn(() async{
      if(itemsEntity.isEmpty) return false;
    itemsEntity.forEach((itemEntity) async{
      if(itemEntity.description != null && itemEntity.description!.isNotEmpty && itemEntity.title != null && itemEntity.title!.isNotEmpty && itemEntity.price != null && itemEntity.quantity != null) {
        await isar!.itemEntitys.put(itemEntity);
      }
    });
        });
    return true;
  }
}