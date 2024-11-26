import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'student_form.dart';
import 'database_helper.dart';

class ViewStudent extends StatelessWidget {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  ViewStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
      body: StreamBuilder<DatabaseEvent>(
        stream: _dbHelper.getStudents().onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
            Map<dynamic, dynamic> students =
                Map<dynamic, dynamic>.from(snapshot.data!.snapshot.value as Map);

            return ListView(
              children: students.keys.map((key) {
                Map<dynamic, dynamic> student = Map<String, dynamic>.from(students[key]);
                return Card(
                  child: ListTile(
                    leading: Icon(student['name'].toString().toLowerCase().contains('female')
                        ? Icons.female
                        : Icons.male),
                    title: Text(student['name']),
                    subtitle: Text(student['institution']),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.phone),
                          onPressed: () => _callStudent(student['phone']),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _deleteStudent(context, key),
                        ),
                      ],
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StudentForm(studentId: key, studentData: Map<String, dynamic>.from(student)),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }
          return const Center(child: Text('No students found'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StudentForm())),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _deleteStudent(BuildContext context, String studentId) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Are you sure to delete?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              _dbHelper.deleteStudent(studentId);
              Navigator.of(ctx).pop();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  void _callStudent(String phone) {
    // Here, replace with actual phone call functionality if on a real device
    if (kDebugMode) {
      print('Calling $phone');
    }
  }
}
