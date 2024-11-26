import 'package:flutter/material.dart';
import 'student_form.dart';
import 'view_student.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/images/logo.png', height: 200), // Logo
            const SizedBox(height: 20),
            const Text('Efficiently manage student records', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.person_add),
              label: const Text('Student Form'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StudentForm())),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.list),
              label: const Text('View Students'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ViewStudent())),
            ),
          ],
        ),
      ),
    );
  }
}
