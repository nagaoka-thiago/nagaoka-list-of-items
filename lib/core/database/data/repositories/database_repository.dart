import '../../domain/entities/item_entity.dart';

abstract class DatabaseRepository {
  Future<bool> writeItemEntity(ItemEntity itemEntity);
  Future<bool> writeItemsEntity(List<ItemEntity> itemsEntity);
  Future<bool> deleteItemEntity(ItemEntity itemEntity);
  Future<List<ItemEntity>> getItemEntityByTitle(String title);
  Future<List<ItemEntity>> getItemsEntity();
}