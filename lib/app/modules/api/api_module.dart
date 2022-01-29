import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/app/modules/api/api_controller.dart';

class ApiModule extends Module {
  @override
  final List<Bind> binds = [Bind.singleton((i) => ApiController())];

  @override
  final List<ModularRoute> routes = [];
}
