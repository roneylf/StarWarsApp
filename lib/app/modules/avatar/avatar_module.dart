import 'package:star_wars/app//modules/avatar/avatar_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AvatarModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AvatarStore()),
  ];
}
