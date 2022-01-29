import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/app/modules/api/api_controller.dart';
import 'package:star_wars/app/modules/bd/bd_controller.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => BdController()),
    Bind.singleton((i) => ApiController())
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
