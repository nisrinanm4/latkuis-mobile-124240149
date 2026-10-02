import 'package:flutter/material.dart';
import '../data.dart';
import 'detail_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Index untuk mengontrol tab aktif pada BottomNavigationBar (0: Home, 1: Profile)
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Daftar halaman yang akan ditampilkan sesuai tab yang dipilih di bawah
    final List<Widget> _pages = [
      // === TAB 0: HALAMAN UTAMA (KATALOG MENU) ===
      Scaffold(
        body: Column(
          children: [
            // === BONUS +10: Banner Sambutan / Informasi Spesial ===
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(12.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepOrange.shade200),
              ),
              child: Row(
                children: [
                  const Icon(Icons.local_fire_department, color: Colors.deepOrange, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo, ${widget.username}!',
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepOrange),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Selamat datang di katalog spesial hari ini. Nikmati menu favoritmu!',
                          style: TextStyle(fontSize: 12, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // === POIN: Menampilkan minimal 6 menu Gacoan menggunakan ListView ===
            Expanded(
              child: ListView.builder(
                itemCount: menus.length,
                itemBuilder: (context, index) {
                  final menu = menus[index];
                  
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    elevation: 3,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8),
                      
                      // === POIN: Gambar Menu ===
                      leading: Image.asset(
                        menu.image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Icon(Icons.fastfood, size: 40),
                      ),
                      
                      // === POIN: Nama Menu & Badge Best Seller ===
                      title: Row(
                        children: [
                          Expanded(child: Text(menu.name, style: const TextStyle(fontWeight: FontWeight.bold))),
                          if (index == 0 || index == 1)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                'Favorit',
                                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                            ),
                        ],
                      ),
                      
                      // === POIN: Harga & Kategori (Ditampilkan lengkap agar sesuai ketentuan) ===
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          // Harga Menu
                          Text(
                            'Rp ${menu.price}', 
                            style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)
                          ),
                          const SizedBox(height: 2),
                          // Kategori Menu
                          Text(
                            'Kategori: ${menu.category}', 
                            style: TextStyle(color: Colors.grey[600], fontSize: 12)
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      
                      // === POIN: Menu dapat diklik untuk membuka Detail Menu ===
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailPage(menu: menu)),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // === TAB 1: HALAMAN PROFIL (Menerima data username) ===
      ProfilePage(username: widget.username),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Menu - Gacoan'),
        automaticallyImplyLeading: false, // Menghilangkan tombol back bawaan
      ),
      // Menampilkan halaman sesuai tab yang aktif di navigasi bawah
      body: _pages[_currentIndex],
      
      // === BOTTOM NAVIGATION BAR (Navigasi Bawah) ===
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepOrange, // Warna ikon saat aktif
        unselectedItemColor: Colors.grey,     // Warna ikon saat tidak aktif
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Mengganti tab saat diklik
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}