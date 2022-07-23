import 'package:sqflite/sqflite.dart';

class StorageService {
  StorageService() {
    print('Storage Service called $dhikrId');
  }
  String mode = 'prayer';
  int dhikrId = 0;
  int counts = 0;
  Future select({required String sql, required Database db}) async {
    try {
      return db.rawQuery(sql);
    } catch (e) {
      print('selectError - $e');
      return [];
    }
  }

  Future insert({
    required String sql,
    required List data,
    required Database db,
  }) async {
    try {
      return db.rawQuery(sql, data);
    } catch (e) {
      print('inserError - $e');
      return [];
    }
  }

  Future delete({required Database db, required sql, required data}) async {
    try {
      return db.rawQuery(sql, data);
    } catch (e) {
      print('DeleteError - $e');
      return [];
    }
  }

  Future<List> queryTheme(db) async {
    return await select(
      sql: 'SELECT theme FROM theme LIMIT 1',
      db: db,
    );
  }

  getTheme({required Database db}) async {
    List themeQ = await queryTheme(db);

    if (themeQ.isEmpty) {
      await insert(
        sql: 'INSERT OR REPLACE INTO theme (id, theme) VALUES (?, ?)',
        data: [1, 'light'],
        db: db,
      );

      themeQ = await queryTheme(db);
    }

    return themeQ.first['theme'];
  }

  //save theme data
  setTheme({required String theme, required Database db}) async {
    await insert(
      sql: 'INSERT OR REPLACE INTO theme (id, theme) VALUES (?, ?)',
      data: [1, theme],
      db: db,
    );
  }

  //save counter
  saveCounts({required List data, required Database db}) async {
    insert(
      sql:
          'INSERT INTO saved_count (id, title, counted, image, createdAt) VALUES(?, ?, ?, ?, ?)',
      data: data,
      db: db,
    );
  }

  // get saved counts
  Future<List<dynamic>> getAllSavedCount({required Database db}) async {
    List saved = await select(
      sql: 'SELECT * FROM saved_count ORDER BY rId DESC',
      db: db,
    );
    return saved;
  }

  setMode(String sMode) {
    mode = sMode;
  }

  setDhikrId(int sId) {
    dhikrId = sId;
  }

  setCounted(int count) {
    counts = count;
  }

  deleteCountRecord({required Database db, required id}) {
    delete(
      db: db,
      sql: 'DELETE FROM saved_count WHERE id = ?',
      data: [id],
    );
  }

  resetCounter() {
    counts = 0;
  }
}
