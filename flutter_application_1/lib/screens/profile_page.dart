import 'package:flutter/material.dart';
import 'about_page.dart';
import 'edit_profile_page.dart'; // Import halaman edit
import '../theme/theme_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Data profil sekarang disimpan di state
  String _name = 'Mr.L25';
  String _title = 'flutter developer';
  String _description = 'Latihan Futter';
  String _email = 'tekno@test.com';
  String _phone = '+62 812 3456 7890';

  // Fungsi untuk navigasi ke halaman edit dan menerima data kembali
  void _editProfile() async {
    final Map<String, String> currentData = {
      'name': _name,
      'title': _title,
      'description': _description,
      'email': _email,
      'phone': _phone,
    };

    // Tunggu hasil dari EditProfilePage
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(initialData: currentData),
      ),
    );

    // Jika user menyimpan (result tidak null), update state
    if (result != null && mounted) {
      setState(() {
        _name = result['name']!;
        _title = result['title']!;
        _description = result['description']!;
        _email = result['email']!;
        _phone = result['phone']!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Card App'),
        actions: [
          // Theme toggle button — cycles System -> Light -> Dark
          ValueListenableBuilder<ThemeMode>(
            valueListenable: themeModeNotifier,
            builder: (context, mode, _) {
              return IconButton(
                tooltip: 'Ganti Tema',
                icon: Icon(themeIconFor(mode)),
                onPressed: cycleThemeMode,
              );
            },
          ),
          IconButton(
            tooltip: 'Tentang Aplikasi',
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Local asset image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/image/UTB.png',
                      width: 200,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image, size: 100),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Gunakan data dari state
                  Text(_name, style: Theme.of(context).textTheme.titleLarge),
                  Text(_title, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text(_description, textAlign: TextAlign.center),
                  const Divider(height: 30),
                  Text('Email: $_email'),
                  Text('Telepon: $_phone'),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _editProfile,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
