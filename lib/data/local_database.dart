import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class LocalDatabase {
  static final LocalDatabase _instance = LocalDatabase._internal();
  factory LocalDatabase() => _instance;
  LocalDatabase._internal();

 late Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}database.db';
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NULL,
        email TEXT NULL,
        phone TEXT NULL, 
        username TEXT UNIQUE,
        password TEXT,
      )
    ''');
  }

 // create
  Future<int> insert(Map<String, dynamic> row,String table) async {
    var dbClient = await database;
    return await dbClient!.insert(table, row);
  }

  // read
  Future<List<Map<String, dynamic>>> queryAll(String table) async {
    var dbClient = await database;
    return await dbClient!.query(table);
  }

  // update
  Future<int> update(Map<String, dynamic> row,String table) async {
    var dbClient = await database;
    return await dbClient!.update(table, row,
        where: 'id = ?', whereArgs: [row['id']]);
  }

  // delete
  Future<int> delete(int id,String table) async {
    var dbClient = await database;
    return await dbClient!.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}