import 'package:mobx/mobx.dart';
import 'package:star_wars/app/modules/models/character.dart';
import 'package:star_wars/app/modules/models/film.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  Pages selectPage = Pages.WebView;

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @action
  void setSelectPage(Pages page) => selectPage = page;

  @action
  void setFilms(List<Film> films) {
    print("filmes sendo adionado no BD");
    print(films);
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
    this.films.add(film);
    print(film.id);
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
