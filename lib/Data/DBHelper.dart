import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Entity/Agua.dart';
import 'Entity/Alimento.dart';
import 'Entity/Peso.dart';
import 'Entity/Pollo.dart';

class DBHelper {
  var database;

  void createDatabase() async {
    database =
        openDatabase(join(await getDatabasesPath(), 'doggie_database.db'),
            onCreate: (db, version) {
      db.execute(
          "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER) ");
      db.execute(
          "CREATE TABLE alimento(id INTEGER PRIMARY KEY, alimento DOUBLE, date  TEXT) ");
      db.execute(
          "CREATE TABLE peso(id INTEGER PRIMARY KEY, peso DOUBLE, date TEXT) ");
      return db.execute(
          "CREATE TABLE pollo(id INTEGER PRIMARY KEY, pollo DOUBLE, date TEXT)");
    }, version: 1);
  }

  Future<void> insertWater(Agua agua) async {
    final Database db = await database;
    await db.insert(
      'Agua',
      agua.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertFood(Alimento alimento) async {
    final Database db = await database;
    await db.insert(
      'Alimento',
      alimento.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertChiken(Pollo pollo) async {
    final Database db = await database;
    await db.insert(
      'Pollos',
      pollo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertWeight(Peso peso) async {
    final Database db = await database;
    await db.insert(
      'Peso',
      peso.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
