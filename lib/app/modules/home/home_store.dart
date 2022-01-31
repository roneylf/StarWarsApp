// ignore_for_file: unnecessary_this, constant_identifier_names

import 'package:mobx/mobx.dart';
import 'package:star_wars/app/modules/models/character.dart';
import 'package:star_wars/app/modules/models/film.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  Pages selectPage = Pages.Films;

  @observable
  int posAnimatedPosictioned = 0;
  //deve ser um valor separado de selectPage pois deve ser
  //setado antes de selectPage para que a tela inteira
  //não seja reconstruida antes do termino da animação
  //pois um um observer esta em HomePage reconstruindo NavBar
  //com base em selectPage

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @action
  void setSelectPage({required Pages page, bool finish = true}) {
    posAnimatedPosictioned = Pages.values.indexOf(page);
    if (finish) {
      selectPage = page;
    }
  }

  @action
  finishSelectPage() {
    selectPage = Pages.values[posAnimatedPosictioned];
  }

  @action
  void setFilms(List<Film> films) {
    this.films.addAll(films);
  }

  @action
  void setCharacters(List<Character> characters) =>
      this.characters.addAll(characters);

  @action
  void addCharacter(Character character) {
    this.characters.add(character);
  }

  @action
  void modifyCharacter(Character oldCharacter, Character newCharacter) {
    this.characters.insert(characters.indexOf(oldCharacter), newCharacter);
    this.characters.remove(oldCharacter);
  }

  @action
  void modifyFilm(Film oldFilm, Film newFilm) {
    this.films.insert(films.indexOf(oldFilm), newFilm);
    this.films.remove(oldFilm);
  }

  @action
  void addFilm(Film film) {
    films.add(film);
  }

  @computed
  List get favorites {
    List list = [];
    for (var character in this.characters) {
      if (character.favorite) {
        list.add(character);
      }
    }
    for (var film in this.films) {
      if (film.favorite) {
        list.add(film);
      }
    }
    return list;
  }
}

enum Pages { Films, Characters, Favorites, WebView, Avatar }
