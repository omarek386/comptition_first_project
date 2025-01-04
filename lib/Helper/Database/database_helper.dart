import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/not_model.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static final _dbName = "notes.db";
  static final _dbVersion = 1;
  static final _tableName = "notes";

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
        id INTEGER PRIMARY KEY,
        title TEXT,
        content TEXT,
        dateTimeEdited TEXT,
        dateTimeCreated TEXT
      )
    ''');
    return batch.commit();
  }

  // Add Note
  Future<int> addNote(Note note) async {
    Database db = await instance.database;
    return await db.insert(_tableName, note.toMap());
  }

  // Delete Note
  Future<int> deleteNote(Note note) async {
    Database db = await instance.database;
    return await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [note.id],
    );
  }

  // Delete All Notes
  Future<int> deleteAllNotes() async {
    Database db = await instance.database;
    return await db.delete(_tableName);
  }

  // Update Note
  Future<List> updateNote(Note note) async {
    Database db = await instance.database;
    Batch batch = db.batch();
    batch.update(
      _tableName,
      note.toMap(),
      where: "id = ?",
      whereArgs: [note.id],
    );
    return batch.commit();
  }

  Future<List<Note>> getNoteList() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName);
    // return maps.map((e) => Note.fromMap(e)).toList();
    return List.generate(
      maps.length,
      (index) {
        return Note(
          id: maps[index]["id"],
          title: maps[index]["title"],
          content: maps[index]["content"],
          dateTimeEdited: maps[index]["dateTimeEdited"],
          dateTimeCreated: maps[index]["dateTimeCreated"],
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
