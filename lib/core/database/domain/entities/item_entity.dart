import 'package:isar/isar.dart';

part 'item_entity.g.dart';

@collection
class ItemEntity {
  Id id = Isar.autoIncrement;

  String? title;
  String? description;
  double? price;
  int? quantity;
}