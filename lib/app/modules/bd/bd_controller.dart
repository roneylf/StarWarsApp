import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
}
