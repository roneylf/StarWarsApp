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
    var bd = await openDatabase(path,
        version: 9,
        onCreate: _onCreate,
        onOpen: _onOpen,
        onUpgrade: _onUpgrade);
    return bd;
  }

  void _onOpen(Database db) {
    return;
    db.rawDelete("DELETE FROM characters");
    db.rawDelete("DELETE FROM films");
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE films(id INTEGER PRIMARY KEY,  title TEXT, favorite INTEGER)");
    await db.execute(
        "CREATE TABLE characters(id INTEGER PRIMARY KEY,  name TEXT, favorite INTEGER)");
    await db
        .execute("CREATE TABLE avatar(id INTEGER PRIMARY KEY,  infos String)");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    db.execute("DROP TABLE IF EXISTS films");
    db.execute("DROP TABLE IF EXISTS characters");
    db.execute("DROP TABLE IF EXISTS avatar");
    await db.execute(
        "CREATE TABLE films(id INTEGER PRIMARY KEY,  title TEXT, favorite INTEGER)");
    await db.execute(
        "CREATE TABLE characters(id INTEGER PRIMARY KEY,  name TEXT, favorite INTEGER)");
    await db
        .execute("CREATE TABLE avatar(id INTEGER PRIMARY KEY,  infos String)");
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
    print(result);
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
    print("Filme para atualizar: ${film.id}");
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

  Future<void> saveAvatar(String avatar) async {
    var bd = await database;
    var result = await bd.rawQuery("SELECT * FROM avatar");
    if (result.isEmpty) {
      await bd.rawInsert("INSERT INTO avatar (infos) VALUES ('$avatar')");
    } else {
      await bd.rawUpdate("UPDATE avatar SET infos = '$avatar'");
    }
    return;
  }

  Future<Object?> getAvatar() async {
    var bd = await database;
    var result = await bd.rawQuery("SELECT * FROM avatar");
    return result.isNotEmpty ? result.first["infos"] : null;
  }
}
