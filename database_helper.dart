import 'package:firebase_database/firebase_database.dart';

class DatabaseHelper {
  final DatabaseReference _database = FirebaseDatabase.instance.ref().child('students');

  Future<void> addStudent(Map<String, dynamic> studentData) async {
    await _database.push().set(studentData);
  }

  Future<void> updateStudent(String id, Map<String, dynamic> studentData) async {
    await _database.child(id).update(studentData);
  }

  Future<void> deleteStudent(String id) async {
    await _database.child(id).remove();
  }

  DatabaseReference getStudents() {
    return _database;
  }
}
