import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/app/modules/api/api_controller.dart';
import 'package:star_wars/app/modules/bd/bd_controller.dart';
import 'package:star_wars/app/modules/home/home_store.dart';
import 'package:star_wars/app/modules/models/character.dart';

class HomeController {
  final db = Modular.get<BdController>();
  final api = Modular.get<ApiController>();
  final store = Modular.get<HomeStore>();

  void getAllFilms() async {
    var filmsDb = await db.getFilms();
    store.setFilms(filmsDb);
    var filmsApi = await api.getFilms();
    filmsApi.forEach((f) async {
      if (!filmsDb.any((fDb) => fDb.apiId == f.apiId)) {
        await db.insertFilm(f);
        store.addFilm(f);
      }
    });
  }

  void getAllCharacters() async {
    var charactersDb = await db.getCharacters();
    store.setCharacters(charactersDb);
    var charactersApi = await api.getCharacters();
    charactersApi.forEach((c) async {
      if (!charactersDb.any((cDb) => cDb.apiId == c.apiId)) {
        await db.insertCharacter(c);
        store.addCharacter(c);
      }
    });
  }

  void setfavoriteCharacters(Character character) async {
    var charactersDb = await db.getCharacters();
    charactersDb.forEach((cDb) {
      if (cDb.apiId == character.apiId) {
        cDb.favorite = character.favorite;
        db.updateCharacter(cDb);
      }
    });
  }
}
