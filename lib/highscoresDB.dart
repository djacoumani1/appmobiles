import 'dart:async';
import 'dart:io';
import 'Model_Highscore.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class HighscoresDB{

  HighscoresDB._privateConstructor();
  static final HighscoresDB instance = HighscoresDB._privateConstructor();

  static Database? _database;
  Future<Database> get database async =>
      _database ??= await initializeDB();

  Future<Database> initializeDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    return await openDatabase(
      join(documentsDirectory.path, 'highscores.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE donnees(
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    date TEXT NOT NULL, 
    name TEXT NOT NULL, 
    score TEXT NOT NULL
    )        
    ''');
  }
  Future<int> insert(Highscores highscore) async {
     Database db = await instance.database;
    return await db.insert(
      'donnees',
      highscore.toMap(),
    );
  }

  Future<List<Highscores>> allHighscores() async {

    final db = await instance.database;
    var highscores = await db.query('donnees');
    List<Highscores> highscoresList = highscores.isNotEmpty
    ? highscores.map((c) => Highscores.fromMap(c)).toList()
    : [];
    return highscoresList;
  }

  Future<void> update(Highscores highscore) async {

    final db = await instance.database;
    await db.update(
      'donnees',
      highscore.toMap(),
      where: 'id = ?',
      whereArgs: [highscore.id],
    );
  }

  Future<void> delete(int id) async {

    final db =await instance.database;
    await db.delete(
      'donnees',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  }

