import 'dart:developer';

import 'package:assignsix/data/models/appointment_model.dart';
import 'package:path/path.dart';
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
    String path = join(await getDatabasesPath(), 'appointments.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE appointments (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            dob TEXT NOT NULL,
            gender TEXT NOT NULL,
            purpose TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<bool> insertAppointment(AppointmentModel appointment) async {
    try {
      final db = await database;
      await db.insert(
        'appointments',
        appointment.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> deleteAllAppointments() async {
    try {
      final db = await database;
      await db.delete('appointments');
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<List<AppointmentModel>> getAppointments() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('appointments');

    return List.generate(maps.length, (i) {
      return AppointmentModel.fromMap(maps[i]);
    });
  }

  Future<bool> updateAppointment(AppointmentModel appointment) async {
    try {
      final db = await database;
      await db.update(
        'appointments',
        appointment.toMap(),
        where: 'id = ?',
        whereArgs: [appointment.id],
      );
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> deleteAppointment(int id) async {
    try {
      final db = await database;
      await db.delete(
        'appointments',
        where: 'id = ?',
        whereArgs: [id],
      );
      return true;
    } on Exception catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<AppointmentModel?> getAppointment(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'appointments',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return AppointmentModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
