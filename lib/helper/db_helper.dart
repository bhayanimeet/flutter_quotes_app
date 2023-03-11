import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/favorite.dart';

class DBHelper{
  DBHelper._();
  static final DBHelper dbHelper = DBHelper._();

  Database? db;

  static const tableName = "Favorite";
  static const id = "id";
  static const image = "image";

  Future<void> dataTable() async {
    String directory = await getDatabasesPath();
    String path = join(directory, "demo.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String query = "CREATE TABLE IF NOT EXISTS $tableName($id INTEGER PRIMARY KEY AUTOINCREMENT,$image BLOB)";
        await db.execute(query);
      },
    );
  }

  Future<int> insertData({required Favorite data}) async {
    await dataTable();

    String query = "INSERT INTO $tableName($image) VALUES(?)";
    List args = [data.image];

    int res = await db!.rawInsert(query, args);

    return res;
  }

  Future<List<Favorite>> selectData() async {
    await dataTable();

    String query = "SELECT * FROM $tableName;";

    List<Map<String, dynamic>> allRecords = await db!.rawQuery(query);

    List<Favorite> allStudent = allRecords.map((e) => Favorite.fromMap(data: e)).toList();

    return allStudent;
  }

  Future<int> deleteData({required int index}) async {
    await dataTable();

    String query = "DELETE FROM $tableName WHERE $id=?;";

    int res = await db!.rawDelete(query, [index]);

    return res;
  }
}