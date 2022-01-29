import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:star_wars/app/modules/models/character.dart';
import 'package:star_wars/app/modules/models/film.dart';

class BdController {
  static final BdController _instance = BdController._internal();

  factory BdController() => _instance;

  BdController._internal();

  late Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initBd();
      return _database;
    }
  }

  initBd() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "bd.db");
    print(path);
    var bd = await openDatabase(path, version: 1, onCreate: _onCreate);
    return bd;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE films(id INTEGER PRIMARY KEY, apiId INTEGER, title TEXT, favorite BOOLEAN)");
    await db.execute(
        "CREATE TABLE characters(id INTEGER PRIMARY KEY, apiId INTEGER, name TEXT, favorite BOOLEAN)");
  }

  Future<int> insertFilm(Film film) async {
    var bd = await database;
    var result = await bd.insert("films", film.toMap());
    return result;
  }

  Future<int> insertCharacter(Character character) async {
    var bd = await database;
    var result = await bd.insert("characters", character.toMap());
    return result;
  }

  Future<List<Film>> getFilms() async {
    var bd = await database;
    var result = await bd.query("films");
    List<Film> films =
        result.isNotEmpty ? result.map((c) => Film.fromMap(c)).toList() : [];
    return films;
  }

  Future<List<Character>> getCharacters() async {
    var bd = await database;
    var result = await bd.query("characters");
    List<Character> characters = result.isNotEmpty
        ? result.map((c) => Character.fromMap(c)).toList()
        : [];
    return characters;
  }

  Future<Film?> getFilm(int id) async {
    var bd = await database;
    var result = await bd.query("films", where: "id = ?", whereArgs: [id]);
    return result.isNotEmpty ? Film.fromMap(result.first) : null;
  }

  Future<Character?> getCharacter(int id) async {
    var bd = await database;
    var result = await bd.query("characters", where: "id = ?", whereArgs: [id]);
    return result.isNotEmpty ? Character.fromMap(result.first) : null;
  }

  Future<int> updateFilm(Film film) async {
    var bd = await database;
    var result = await bd
        .update("films", film.toMap(), where: "id = ?", whereArgs: [film.id]);
    return result;
  }

  Future<int> updateCharacter(Character character) async {
    var bd = await database;
    var result = await bd.update("characters", character.toMap(),
        where: "id = ?", whereArgs: [character.id]);
    return result;
  }

  Future<int> deleteFilm(int id) async {
    var bd = await database;
    var result = await bd.delete("films", where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<int> deleteCharacter(int id) async {
    var bd = await database;
    var result =
        await bd.delete("characters", where: "id = ?", whereArgs: [id]);
    return result;
  }
}
