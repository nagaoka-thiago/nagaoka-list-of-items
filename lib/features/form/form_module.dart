import 'package:flutter_modular/flutter_modular.dart';
import 'package:nagaoka_list_items/core/database/domain/entities/item_entity.dart';

import '../../core/database/domain/usecases/write_item_entity_usecase.dart';
import 'view/controller/form_page_controller.dart';
import 'view/pages/form_page.dart';

class FormModule extends Module {
  @override
  List<Bind> get binds => [
    Bind<WriteItemEntityUsecase>((i) => DefaultWriteItemEntityUsecase(),),
    Bind<FormPageController>((i) => FormPageController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => FormPage(itemEntity: args.data['itemEntity'] != null ? args.data['itemEntity'] as ItemEntity : null))
  ];
}