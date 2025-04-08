import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  final Dio _dio = Dio(); // Initialize Dio instance

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('rent_app.db');
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, fileName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE houses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imagePath TEXT NOT NULL,
        title TEXT NOT NULL,
        price TEXT NOT NULL,
        location TEXT NOT NULL
      )
    ''');
  }

  // Insert a house into the database
  Future<void> insertHouse({
    required String imageUrl,
    required String title,
    required String price,
    required String location,
  }) async {
    final db = await database;

    // Download and save the image locally using Dio
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = join(directory.path, '${title.replaceAll(" ", "_")}.jpg');

    try {
      await _dio.download(
        imageUrl,
        imagePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
          }
        },
      );
    } catch (e) {
      return; // Handle the error as needed
    }

    // Insert into database
    await db.insert('houses', {
      'imagePath': imagePath,
      'title': title,
      'price': price,
      'location': location,
    });
  }

  // Fetch all houses
  Future<List<Map<String, dynamic>>> getHouses() async {
    final db = await database;
    return await db.query('houses');
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}