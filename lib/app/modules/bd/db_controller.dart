import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:star_wars/app/modules/models/character.dart';
import 'package:star_wars/app/modules/models/film.dart';

class DbController {
  static final DbController _instance = DbController._internal();

  factory DbController() => _instance;

  DbController._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initBd();
      return _database!;
    }
  }

  initBd() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "database.db");
    print(path);
    var bd = await openDatabase(path, version: 3, onCreate: _onCreate);
    return bd;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE films(uuid INTEGER PRIMARY KEY, apiuid INTEGER, title TEXT, favorite INTEGER)");
    await db.execute(
        "CREATE TABLE characters(uuid INTEGER PRIMARY KEY, apiuid INTEGER, name TEXT, favorite INTEGER)");
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

  Future<Film?> getFilm(int uid) async {
    var bd = await database;
    var result = await bd.query("films", where: "uid = ?", whereArgs: [uid]);
    return result.isNotEmpty ? Film.fromMap(result.first) : null;
  }

  Future<Character?> getCharacter(int uid) async {
    var bd = await database;
    var result =
        await bd.query("characters", where: "uid = ?", whereArgs: [uid]);
    return result.isNotEmpty ? Character.fromMap(result.first) : null;
  }

  Future<int> updateFilm(Film film) async {
    var bd = await database;
    var result = await bd
        .update("films", film.toMap(), where: "uid = ?", whereArgs: [film.uid]);
    return result;
  }

  Future<int> updateCharacter(Character character) async {
    var bd = await database;
    var result = await bd.update("characters", character.toMap(),
        where: "uid = ?", whereArgs: [character.uid]);
    return result;
  }

  Future<int> deleteFilm(int uid) async {
    var bd = await database;
    var result = await bd.delete("films", where: "uid = ?", whereArgs: [uid]);
    return result;
  }

  Future<int> deleteCharacter(int uid) async {
    var bd = await database;
    var result =
        await bd.delete("characters", where: "uid = ?", whereArgs: [uid]);
    return result;
  }
}
