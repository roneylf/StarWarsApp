import 'package:dio/dio.dart';
import 'package:star_wars/app/modules/models/character.dart';
import 'package:star_wars/app/modules/models/film.dart';

class ApiController {
  // ignore: non_constant_identifier_names
  final String BASE_URL = "https://swapi.dev/api/";

  Dio dio = Dio();

  Future<Response> get(String url) async {
    return await dio.get(BASE_URL + url);
  }

  Future<List<Film>> getFilms() async {
    var response = await get("films");
    List<Film> films = [];
    for (var item in response.data["results"]) {
      films.add(Film.fromMap(item));
    }
    return films;
  }

  Future<Film> getFilm(int id) async {
    var response = await get("films/$id");
    return Film.fromMap(response.data);
  }

  Future<List<Character>> getCharacters() async {
    var response = await get("people");
    List<Character> characters = [];
    for (var item in response.data["results"]) {
      characters.add(Character.fromMap(item));
    }
    return characters;
  }

  Future<Character> getCharacter(int id) async {
    var response = await get("people/$id");
    return Character.fromMap(response.data);
  }
}
