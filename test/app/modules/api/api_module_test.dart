import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:star_wars/app/modules/api/api_controller.dart';
import 'package:star_wars/app/modules/api/api_module.dart';

void main() {
  initModule(ApiModule());

  // ignore: unused_local_variable
  ApiController api = Modular.get<ApiController>();

  test("get Films", () async {
    var filmes = await api.getFilms();
    expect(filmes.length, greaterThan(0));
    expect(filmes[0].title, "A New Hope");
  });

  test("get Characters", () async {
    var people = await api.getCharacters();
    expect(people.length, greaterThan(0));
    expect(people[0].name, "Luke Skywalker");
  });
}
