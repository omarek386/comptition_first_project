import 'package:comptition_first_project/Models/Installment_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static final _dbName = "installment.db";
  static final _dbVersion = 1;
  static final _tableName = "installment";

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initiateDatabase();
    return _database!;
  }

  _initiateDatabase() async {
    String directory = await getDatabasesPath();
    String path = join(directory, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) {
    Batch batch = db.batch();
    batch.execute('''
      CREATE TABLE $_tableName(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        monthlyInstallment TEXT,
        deadTime TEXT,
        note TEXT
      )
    ''');
    return batch.commit();
  }

  // Add Note
  Future<int> addNote(InstallmentModel plan) async {
    Database db = await instance.database;
    return await db.insert(_tableName, plan.toMap());
  }

  // Delete Note
  Future<int> deleteNote(InstallmentModel plan) async {
    Database db = await instance.database;
    return await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [plan.id],
    );
  }

  // Delete All Notes
  Future<int> deleteAllNotes() async {
    Database db = await instance.database;
    return await db.delete(_tableName);
  }

  // Update Note
  Future<List> updateNote(InstallmentModel plan) async {
    Database db = await instance.database;
    Batch batch = db.batch();
    batch.update(
      _tableName,
      plan.toMap(),
      where: "id = ?",
      whereArgs: [plan.id],
    );
    return batch.commit();
  }

  Future<List<InstallmentModel>> getNoteList() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    // return maps.map((e) => Note.fromMap(e)).toList();
    return List.generate(
      maps.length,
      (index) {
        return InstallmentModel(
          id: maps[index]["id"],
          monthlyInstallment: maps[index]["monthlyInstallment"],
          deadTime: maps[index]["deadTime"],
          note: maps[index]["note"],
        );
      },
    );
  }
  //  Future<List<Note>> getNotes() async {
  //   Database db = await database;
  //   List<Map<String, dynamic>> notes = await db.query('notes');
  //   return notes
  //       .map((e) => Note(
  //             id: e['id'],
  //             title: e['title'],
  //             content: e['content'],
  //             dateTimeEdited: e['dateTimeEdited'],
  //             dateTimeCreated: e['dateTimeCreated'],
  //           ))
  //       .toList();
  // }
}
