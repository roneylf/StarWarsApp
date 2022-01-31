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

    var db = await openDatabase(path,
        version: 9, onCreate: _onCreate, onOpen: _onOpen);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE films(id INTEGER PRIMARY KEY,  title TEXT, favorite INTEGER)");
    await db.execute(
        "CREATE TABLE characters(id INTEGER PRIMARY KEY,  name TEXT, favorite INTEGER)");
    await db
        .execute("CREATE TABLE avatar(id INTEGER PRIMARY KEY,  infos String)");
  }

  void _onOpen(Database db) {
    //desabilitado para ser usado somente em produção
    return;
    db.rawDelete("DELETE FROM characters");
    db.rawDelete("DELETE FROM films");
    db.rawDelete("DELETE FROM avatar");
  }

  Future<int> insertFilm(Film film) async {
    var db = await database;
    var result = await db.insert("films", film.toMap());
    return result;
  }

  Future<int> insertCharacter(Character character) async {
    var db = await database;
    var result = await db.insert("characters", character.toMap());
    return result;
  }

  Future<List<Film>> getFilms() async {
    var db = await database;
    var result = await db.query("films");
    List<Film> films =
        result.isNotEmpty ? result.map((c) => Film.fromMap(c)).toList() : [];
    return films;
  }

  Future<List<Character>> getCharacters() async {
    var db = await database;
    var result = await db.query("characters");
    List<Character> characters = result.isNotEmpty
        ? result.map((c) => Character.fromMap(c)).toList()
        : [];
    return characters;
  }

  Future<Film?> getFilm(int id) async {
    var db = await database;
    var result = await db.query("films", where: "id = ?", whereArgs: [id]);
    return result.isNotEmpty ? Film.fromMap(result.first) : null;
  }

  Future<Character?> getCharacter(int id) async {
    var db = await database;
    var result = await db.query("characters", where: "id = ?", whereArgs: [id]);
    return result.isNotEmpty ? Character.fromMap(result.first) : null;
  }

  Future<int> updateFilm(Film film) async {
    var db = await database;
    var result = await db
        .update("films", film.toMap(), where: "id = ?", whereArgs: [film.id]);
    return result;
  }

  Future<int> updateCharacter(Character character) async {
    var db = await database;
    var result = await db.update("characters", character.toMap(),
        where: "id = ?", whereArgs: [character.id]);
    return result;
  }

  Future<int> deleteFilm(int id) async {
    var db = await database;
    var result = await db.delete("films", where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<int> deleteCharacter(int id) async {
    var db = await database;
    var result =
        await db.delete("characters", where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<void> saveAvatar(String avatar) async {
    var db = await database;
    var result = await db.rawQuery("SELECT * FROM avatar");
    if (result.isEmpty) {
      await db.rawInsert("INSERT INTO avatar (infos) VALUES ('$avatar')");
    } else {
      await db.rawUpdate("UPDATE avatar SET infos = '$avatar'");
    }
    return;
  }

  Future<Object?> getAvatar() async {
    var db = await database;
    var result = await db.rawQuery("SELECT * FROM avatar");
    return result.isNotEmpty ? result.first["infos"] : null;
  }
}
