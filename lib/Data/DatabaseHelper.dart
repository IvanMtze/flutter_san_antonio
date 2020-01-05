import 'package:flutter_san_antonio/Model/Entity/Agua.dart';
import 'package:flutter_san_antonio/Model/Entity/Alimento.dart';
import 'package:flutter_san_antonio/Model/Entity/Peso.dart';
import 'package:flutter_san_antonio/Model/Entity/Pollo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database _database;

  _initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "main.db");
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();

    return _database;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, username TEXT, password TEXT)");
    await db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER) ");
    await db.execute(
        "CREATE TABLE alimento(id INTEGER PRIMARY KEY, alimento DOUBLE, date  TEXT) ");
    await db.execute(
        "CREATE TABLE peso(id INTEGER PRIMARY KEY, peso DOUBLE, date TEXT) ");
    await db.execute(
        "CREATE TABLE pollo(id INTEGER PRIMARY KEY, pollo DOUBLE, date TEXT)");
  }

  Future<int> insertaPollo(Pollo pollo) async {
    var database = await db;
    return database.insert('pollo', pollo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertaAlimento(Alimento alimento) async {
    var database = await db;
    return database.insert('alimento', alimento.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertaPeso(Peso peso) async {
    var database = await db;
    return database.insert('peso', peso.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertaAgua(Agua agua) async {
    var database = await db;
    return database.insert('agua', agua.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
