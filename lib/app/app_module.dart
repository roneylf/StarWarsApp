import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/app/modules/api/api_controller.dart';
import 'package:star_wars/app/modules/bd/db_controller.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => DbController()),
    Bind.singleton((i) => ApiController())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
