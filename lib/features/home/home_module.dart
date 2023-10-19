import 'package:flutter_modular/flutter_modular.dart';

import '../../core/database/domain/usecases/delete_item_entity_usecase.dart';
import '../../core/database/domain/usecases/get_items_entity_usecase.dart';
import 'view/controller/home_page_controller.dart';
import 'view/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind<GetItemsEntityUsecase>((i) => DefaultGetItemsEntityUsecase(),),
    Bind<DeleteItemEntityUsecase>((i) => DefaultDeleteItemEntityUsecase(),),
    Bind<HomePageController>((i) => HomePageController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage())
  ];
}