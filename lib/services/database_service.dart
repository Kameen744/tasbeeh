import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tasbeeh/data/dhikr_data.dart';
import 'package:tasbeeh/models/dhikr_data_model.dart';

class DatabaseService {
  Future<Database> createDatabase() async {
    Database database;
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, 'dhikr.db');
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      db.execute(
          'CREATE TABLE IF NOT EXISTS theme (rId INTEGER PRIMARY KEY AUTOINCREMENT, id INTEGER NOT NULL, theme TEXT NOT NULL, UNIQUE(id))');
      db.execute(
          'CREATE TABLE IF NOT EXISTS saved_count (rId INTEGER PRIMARY KEY AUTOINCREMENT, id INTEGER NOT NULL, title TEXT NOT NULL, counted INTEGER, image TEXT NOT NULL, createdAt TEXT NOT NULL)');
      db.execute(
          'CREATE TABLE IF NOT EXISTS reminder (rId INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, description TEXT NOT NULL, remindAt TEXT NOT NULL)');
    });
    return database;
  }

  List<DhikrDataModel> dhikrs = DhikrData().data;
}
