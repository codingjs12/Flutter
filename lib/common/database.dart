import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DB {
  static Future<Database> initDB() async {
    String databasePath = await getDatabasesPath();
    String dbPath = join(databasePath, 'firstDB.db');

    return await openDatabase(
        dbPath,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
          CREATE TABLE TBL_USER (
            ID INTEGER PRIMARY KEY AUTOINCREMENT,
            NAME TEXT,
            AGE INTEGER
          )
        ''');
        }
    );
  }

  static Future<void> insertData(String name, int age) async {
    print("name === > $name");
    final db = await initDB();
    await db.insert('TBL_USER', {'name': name, 'age': age});
  }
  static Future<List<Map<String, dynamic>>> loadUser(int userId) async {
    final db = await initDB();
    return await db.query('TBL_USER', where:"id = ?", whereArgs: [userId]);
  }
  static Future<List<Map<String, dynamic>>> getData() async {
    final db = await initDB();
    return await db.query('TBL_USER'); // 테이블의 모든 데이터를 조회
  }

  static Future<int> updateData(int id, String name, int age) async {
    final db = await initDB();
    return await db.update('TBL_USER', {'name': name, 'age': age},
        where: 'id = ?', whereArgs: [id]);
  }

  static Future<int> deleteData(int id) async {
    final db = await initDB();
    return await db.delete('TBL_USER', where: 'id = ?', whereArgs: [id]);
  }

}
