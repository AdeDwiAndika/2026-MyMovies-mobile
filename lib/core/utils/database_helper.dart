// core/utils/database_helper.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'movies.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE favorites(
          id INTEGER PRIMARY KEY,
          title TEXT,
          overview TEXT,
          poster_path TEXT,
          vote_average REAL
        )
        ''');
        print('✅ Database created with correct schema');
      },
    );
  }

  Future<void> clearDatabase() async {
    final db = await database;
    await db.delete('favorites');
  }

  // Method untuk reset database
  Future<void> resetDatabase() async {
    final path = join(await getDatabasesPath(), 'movies.db');
    await deleteDatabase(path);
    _database = null;
    await database; // Akan membuat ulang
    print('✅ Database reset successfully');
  }
}
