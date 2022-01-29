import 'package:mobx/mobx.dart';
import 'package:star_wars/app/modules/models/character.dart';
import 'package:star_wars/app/modules/models/film.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  Pages selectPage = Pages.Films;

  @observable
  ObservableList<Film> films = ObservableList<Film>();

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @action
  void setSelectPage(Pages page) => selectPage = page;

  @action
  void setFilms(List<Film> films) => this.films.addAll(films);

  @action
  void setCharacters(List<Character> characters) =>
      this.characters.addAll(characters);

  @action
  void addCharacter(Character character) => this.characters.add(character);

  @action
  void addFilm(Film film) => this.films.add(film);
}

enum Pages { Films, Characters, Favorites, WebView, Avatar }
