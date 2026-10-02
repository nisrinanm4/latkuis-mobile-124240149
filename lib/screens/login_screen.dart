import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() => _LoginPageState();
}

class _LoginPageState extends State {
  // Controller untuk mengambil teks dari inputan user
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
  // Status untuk mengontrol visibilitas password (sembunyi/tampil)
  bool _obscurePassword = true;

  void _login() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // === VALIDASI INPUT KOSONG ===
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username dan Password tidak boleh kosong!')),
      );
      return;
    }

    // === VALIDASI AKUN SPESIFIK ===
    if (username != 'admingacoan' || password != '1221') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username atau Password salah! (Gunakan admingacoan / 1221)')),
      );
      return; 
    }

    // === NAVIGASI KE HOME & KIRIM USERNAME ===
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(username: username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // === MENGGANTI TEKS DENGAN LOGO GAMBAR DARI ASSETS ===
              Image.asset(
                'assets/logo.png', 
                width: 200,
                height: 200,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.fastfood,
                  size: 80,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Selamat Datang di Gacoan',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 40),
              
              // Input Username
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
              ),
              const SizedBox(height: 16),
              
              // Input Password dengan tombol lihat/sembunyi
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword, 
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword; 
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Tombol Login
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _login, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text('Login', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}