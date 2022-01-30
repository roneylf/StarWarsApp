import 'package:flutter_modular/flutter_modular.dart';
import 'package:star_wars/app/modules/api/api_controller.dart';
import 'package:star_wars/app/modules/bd/db_controller.dart';
import 'package:star_wars/app/modules/home/home_store.dart';
import 'package:star_wars/app/modules/models/character.dart';
import 'package:star_wars/app/modules/models/film.dart';

class HomeController {
  final db = Modular.get<DbController>();
  final api = Modular.get<ApiController>();
  final store = Modular.get<HomeStore>();

  void getAllFilms() async {
    var filmsDb = await db.getFilms();
    store.setFilms(filmsDb);
    var filmsApi = await api.getFilms();
    for (var f in filmsApi) {
      if (!filmsDb.any((fDb) => fDb.title == f.title)) {
        await db.insertFilm(f);
        store.addFilm(f);
      }
    }
  }

  void getAllCharacters() async {
    var charactersDb = await db.getCharacters();
    store.setCharacters(charactersDb);
    var charactersApi = await api.getCharacters();
    for (var c in charactersApi) {
      if (!charactersDb.any((cDb) => cDb.name == c.name)) {
        await db.insertCharacter(c);
        store.addCharacter(c);
      }
    }
  }

  void setfavoriteCharacters(Character character) async {
    var charactersDb = await db.getCharacters();
    for (var c in store.characters) {
      if (c.name == character.name) {
        c.favorite = !c.favorite;
      }
    }
    for (var cDb in charactersDb) {
      if (cDb.name == character.name) {
        cDb.favorite = character.favorite;
        db.updateCharacter(cDb);
      }
    }
  }

  void setFavoriteFilms(Film film) async {
    var filmsDb = await db.getFilms();
    for (var f in store.films) {
      if (f.title == film.title) {
        f.favorite = !f.favorite;
      }
    }
    for (var fDb in filmsDb) {
      if (fDb.title == film.title) {
        fDb.favorite = film.favorite;
        db.updateFilm(fDb);
      }
    }
  }
}
