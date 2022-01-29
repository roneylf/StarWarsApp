import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/app/modules/bd/bd_controller.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind.singleton((i) => BdController())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
