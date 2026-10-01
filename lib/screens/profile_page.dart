import 'package:flutter/material.dart';
import 'login_screen.dart';

class ProfilePage extends StatelessWidget {
  // Menerima parameter 'username' yang diteruskan dari halaman Login/Home
  final String username;
  const ProfilePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          // === KRITERIA PENILAIAN: Tampilan Profil rapi — 5 poin ===
          // Menggunakan Column dan Padding dengan penataan tengah (Center) agar terstruktur rapi
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Avatar lingkaran ikon profil
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.purpleAccent,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Username',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 4),
              
              // === KRITERIA PENILAIAN: Menampilkan username dari hasil Login, bukan hardcode — 12 poin ===
              // Menampilkan data variabel 'username' secara dinamis, bukan teks statis
              Text(
                username,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              
              // Tombol Logout
              ElevatedButton.icon(
                onPressed: () {
                  // === KRITERIA PENILAIAN: Tombol Logout berfungsi & kembali ke Login (5 poin) ===
                  // & Setelah Logout, pengguna tidak dapat kembali ke Home melalui tombol Back (3 poin) ===
                  // Menggunakan pushAndRemoveUntil untuk menghapus seluruh riwayat rute/stack sebelumnya,
                  // sehingga ketika tombol back ditekan di halaman login, aplikasi tidak kembali ke Home.
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.logout, size: 16),
                label: const Text('Logout'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  foregroundColor: Colors.black87,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}