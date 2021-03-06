// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<List<dynamic>>? _$favoritesComputed;

  @override
  List<dynamic> get favorites =>
      (_$favoritesComputed ??= Computed<List<dynamic>>(() => super.favorites,
              name: 'HomeStoreBase.favorites'))
          .value;

  final _$selectPageAtom = Atom(name: 'HomeStoreBase.selectPage');

  @override
  Pages get selectPage {
    _$selectPageAtom.reportRead();
    return super.selectPage;
  }

  @override
  set selectPage(Pages value) {
    _$selectPageAtom.reportWrite(value, super.selectPage, () {
      super.selectPage = value;
    });
  }

  final _$posAnimatedPosictionedAtom =
      Atom(name: 'HomeStoreBase.posAnimatedPosictioned');

  @override
  int get posAnimatedPosictioned {
    _$posAnimatedPosictionedAtom.reportRead();
    return super.posAnimatedPosictioned;
  }

  @override
  set posAnimatedPosictioned(int value) {
    _$posAnimatedPosictionedAtom
        .reportWrite(value, super.posAnimatedPosictioned, () {
      super.posAnimatedPosictioned = value;
    });
  }

  final _$filmsAtom = Atom(name: 'HomeStoreBase.films');

  @override
  ObservableList<Film> get films {
    _$filmsAtom.reportRead();
    return super.films;
  }

  @override
  set films(ObservableList<Film> value) {
    _$filmsAtom.reportWrite(value, super.films, () {
      super.films = value;
    });
  }

  final _$charactersAtom = Atom(name: 'HomeStoreBase.characters');

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void setSelectPage({required Pages page, bool finish = true}) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setSelectPage');
    try {
      return super.setSelectPage(page: page, finish: finish);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic finishSelectPage() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.finishSelectPage');
    try {
      return super.finishSelectPage();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilms(List<Film> films) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setFilms');
    try {
      return super.setFilms(films);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCharacters(List<Character> characters) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setCharacters');
    try {
      return super.setCharacters(characters);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCharacter(Character character) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.addCharacter');
    try {
      return super.addCharacter(character);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void modifyCharacter(Character oldCharacter, Character newCharacter) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.modifyCharacter');
    try {
      return super.modifyCharacter(oldCharacter, newCharacter);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void modifyFilm(Film oldFilm, Film newFilm) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.modifyFilm');
    try {
      return super.modifyFilm(oldFilm, newFilm);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFilm(Film film) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.addFilm');
    try {
      return super.addFilm(film);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectPage: ${selectPage},
posAnimatedPosictioned: ${posAnimatedPosictioned},
films: ${films},
characters: ${characters},
favorites: ${favorites}
    ''';
  }
}
