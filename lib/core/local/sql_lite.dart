import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'constants.dart';

class SqliteService {
  static Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, sqlLiteName),
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE $mortyTableName (
            id INTEGER PRIMARY KEY,
            name TEXT,
            status TEXT,
            species TEXT,
            type TEXT,
            gender TEXT,
            origin TEXT,
            location TEXT,
            image TEXT,
            episode TEXT,
            url TEXT,
            created TEXT
          )
          ''');
      },
      version: sqlLiteVersion,
    );
  }
}
