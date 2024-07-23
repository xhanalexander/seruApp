import 'package:path/path.dart' as pathh;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = pathh.join(await getDatabasesPath(), 'formdata.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE formdata (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        provinsi TEXT,
        kota TEXT,
        kecamatan TEXT
      )
    ''');
  }

  Future<int> insertFormData(Map<String, dynamic> formData) async {
    final db = await database;
    return await db.insert('formdata', formData);
  }

  Future<List<Map<String, dynamic>>> getFormData() async {
    final db = await database;
    return await db.query('formdata');
  }

  Future<int> updateFormData(Map<String, dynamic> formData) async {
    final db = await database;
    return await db.update(
      'formdata',
      formData,
      where: 'id = ?',
      whereArgs: [formData['id']],
    );
  }

  Future<int> deleteFormData(int id) async {
    final db = await database;
    return await db.delete(
      'formdata',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
