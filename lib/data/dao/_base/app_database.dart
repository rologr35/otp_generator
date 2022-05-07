
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'db_constants.dart';
import 'dart:io';

class AppDatabase {
  AppDatabase._privateConstructor();

  static final AppDatabase instance = AppDatabase._privateConstructor();

  Database? _db;

  Future<Database> get db async {
    if (_db == null) await _initDb();
    return _db!;
  }

  _initDb() async {
    String documentsDirectory = Platform.isAndroid ? await getDatabasesPath() : '${(await getApplicationSupportDirectory()).path}/';
    String path = join(documentsDirectory, DBConstants.dbName);
    _db = await openDatabase(path,
        version: DBConstants.dbVersion,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade);
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await _createTables(db);
    }
  }

  Future _onCreate(Database db, int version) async {
    await _createTables(db);
  }

  Future _createTables(Database db) async {
    await _createTable(db, DBConstants.authenticatedEntityTable, DBConstants.tableCols);
  }

  static Future<bool> _createTable(
      Database db, String tableName, Map<String, String> columns) async {
    if (columns.isEmpty) return false;

    try {
      var script = 'CREATE TABLE $tableName ( ';
      for (var key in columns.keys) {
        final val = columns[key];
        if (key == columns.keys.first) {
          script = '$script $key $val PRIMARY KEY';
        } else {
          script = '$script, $key $val';
        }
      }

      script = script + ')';

      await db.execute(script);
      return true;
    } catch (ex) {
      return false;
    }
  }

  Future<int> deleteAll(String tableName) async {
    final res = await _db?.delete(tableName);
    return res!;
  }
}
