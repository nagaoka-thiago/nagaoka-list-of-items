import 'package:flutter/material.dart';

import '../../../../../core/database/domain/entities/item_entity.dart';

class ItemWidget extends StatelessWidget {
  final ItemEntity itemEntity;
  final Function() onPressed;
  final Function() onDeletePressed;
  const ItemWidget({super.key, required this.itemEntity, required this.onPressed, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(itemEntity.title ?? '', style: TextStyle(fontSize: 50)),
      InkWell(
        onTap: onPressed,
        child: Column(children: [
          Text(itemEntity.description ?? '', style: TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis,),
          SizedBox(height: 16,),
          Text('Price: \$${itemEntity.price ?? ''}', style: TextStyle(fontSize: 20)),
          SizedBox(height: 16,),
          Text('Quantity: ${itemEntity.quantity ?? ''}', style: TextStyle(fontSize: 20)),
        ],),
      ),
      CircleAvatar(backgroundColor: Colors.red, child: IconButton(onPressed: onDeletePressed, icon: const Icon(Icons.delete)))
    ]);
  }
}