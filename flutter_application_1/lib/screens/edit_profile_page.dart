import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final Map<String, String> initialData;

  const EditProfilePage({super.key, required this.initialData});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller dengan data yang diterima
    _nameController = TextEditingController(text: widget.initialData['name']);
    _titleController = TextEditingController(text: widget.initialData['title']);
    _descriptionController = TextEditingController(
      text: widget.initialData['description'],
    );
    _emailController = TextEditingController(text: widget.initialData['email']);
    _phoneController = TextEditingController(text: widget.initialData['phone']);
  }

  @override
  void dispose() {
    // Jangan lupa dispose controller!
    _nameController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    // Buat map data baru dari controller
    final newData = {
      'name': _nameController.text,
      'title': _titleController.text,
      'description': _descriptionController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
    };
    // Kirim data baru kembali ke halaman sebelumnya (ProfilePage)
    Navigator.pop(context, newData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title / Jabatan'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Telepon'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _saveProfile,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 16,
                ),
              ),
              child: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
