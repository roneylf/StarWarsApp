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
        int id = await db.insertFilm(f);
        store.addFilm(f.copyWith(id: id));
      }
    }
  }

  void getAllCharacters() async {
    var charactersDb = await db.getCharacters();
    store.setCharacters(charactersDb);
    var charactersApi = await api.getCharacters();
    for (var c in charactersApi) {
      if (!charactersDb.any((cDb) => cDb.name == c.name)) {
        int id = await db.insertCharacter(c);
        store.addCharacter(c.copyWith(id: id));
      }
    }
  }

  void setfavoriteCharacters(Character character) async {
    for (var c in store.characters) {
      if (c.name == character.name) {
        c.favorite = !c.favorite;
        store.modifyCharacter(character, c);
        db.updateCharacter(c);
      }
    }
  }

  void setFavoriteFilms(Film film) async {
    for (var f in store.films) {
      if (f.title == film.title) {
        f.favorite = !f.favorite;
        store.modifyFilm(film, f);
        db.updateFilm(f);
      }
    }
  }
}
