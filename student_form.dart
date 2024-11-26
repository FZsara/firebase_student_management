import 'package:flutter/material.dart';
import 'database_helper.dart';
import 'view_student.dart';

class StudentForm extends StatefulWidget {
  final String? studentId;
  final Map<String, dynamic>? studentData;

  const StudentForm({super.key, this.studentId, this.studentData});

  @override
  // ignore: library_private_types_in_public_api
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final _phoneController = TextEditingController();
  final _institutionController = TextEditingController();
  final _departmentController = TextEditingController();
  final _cgpaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.studentData != null) {
      _nameController.text = widget.studentData!['name'];
      _locationController.text = widget.studentData!['location'];
      _phoneController.text = widget.studentData!['phone'];
      _institutionController.text = widget.studentData!['institution'];
      _departmentController.text = widget.studentData!['department'];
      _cgpaController.text = widget.studentData!['cgpa'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.studentId != null ? 'Update Student' : 'Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField(_nameController, 'Student Name', Icons.person),
              _buildTextField(_locationController, 'Location', Icons.location_on),
              _buildTextField(_phoneController, 'Phone Number', Icons.phone),
              _buildTextField(_institutionController, 'Institution', Icons.school),
              _buildTextField(_departmentController, 'Department', Icons.apartment),
              _buildTextField(_cgpaController, 'CGPA', Icons.grade),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveStudent,
                child: Text(widget.studentId != null ? 'Update' : 'Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
      ),
    );
  }

  void _saveStudent() {
    if (_formKey.currentState!.validate()) {
      final studentData = {
        'name': _nameController.text,
        'location': _locationController.text,
        'phone': _phoneController.text,
        'institution': _institutionController.text,
        'department': _departmentController.text,
        'cgpa': _cgpaController.text,
      };
      if (widget.studentId != null) {
        DatabaseHelper().updateStudent(widget.studentId!, studentData);
      } else {
        DatabaseHelper().addStudent(studentData);
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ViewStudent()));
    }
  }
}
