import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:star_wars/app/app_module.dart';
import 'package:star_wars/app/modules/bd/bd_controller.dart';

import 'package:star_wars/app/modules/models/film.dart';

void main() {
  initModules([AppModule()]);

  test("DB test", () async {
    final db = Modular.get<BdController>();
    expect(db, isNotNull);
    db.insertFilm(Film(id: 1, title: "A New Hope", apiId: 1));
  });
}
