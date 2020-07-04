import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:planlekcji/models/subject.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'k_plan_lekcji.db'),
    onCreate: (db, version) {
      //      int id;
      //      String subject;
      //      List occurrence;
      //      String teacher;
      return db.execute(
        "CREATE TABLE subjects(id INTEGER PRIMARY KEY, subject TEXT, occurrence TEXT, teacher TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  Future<void> insertSubject(Subject subject) async {
    final Database db = await database;

    // Insert subject into subjects table
    // `conflictAlgorithm` replaces previous data in case
    // one subject is inserted multiple times
    await db.insert(
      'subjects',
      subject.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Subject>> subjects() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('subjects');

    // Convert the List<Map<String, dynamic> into a List<Subject>.
    return List.generate(maps.length, (i) {
      return Subject(maps[i]['id'], maps[i]['subject'], maps[i]['occurrence'],
          maps[i]['teacher']);
    });
  }

  Future<void> updateSubject(Subject subject) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'subjects',
      subject.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [subject.id],
    );
  }

  Future<void> deleteSubject(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'subjects',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

//  var fido = Subject(
//    id: 0,
//    name: 'Fido',
//    age: 35,
//  );
//
//  // Insert a dog into the database.
//  await insertDog(fido);
//
//  // Print the list of dogs (only Fido for now).
//  print(await dogs());

  // Update Fido's age and save it to the database.
//  fido = Dog(
//    id: fido.id,
//    name: fido.name,
//    age: fido.age + 7,
//  );
//  await updateDog(fido);

  // Print Fido's updated information.
//  print(await dogs());
//
//  // Delete Fido from the database.
//  await deleteDog(fido.id);
//
//  // Print the list of dogs (empty).
//  print(await dogs());
}
