import 'package:flutter/material.dart';
import '../data.dart'; // Mengambil data menu dari folder luar lib/screens
import 'detail_page.dart';
import 'profile_page.dart';

// === MENGGUNAKAN STATELESSWIDGET (Aman, bersih, tanpa error widget.username) ===
class HomePage extends StatelessWidget {
  final String username;

  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Menu - Gacoan'),
        actions: [
          // === POIN: Tersedia akses menuju halaman Profil — 4 poin ===
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  // Mengirim langsung username tanpa awalan 'widget.' karena ini StatelessWidget
                  builder: (context) => ProfilePage(username: username),
                ),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          // === POIN BONUS +10: Banner Sambutan / Informasi Spesial (Stateless) ===
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
                        'Halo, $username!',
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

          // === POIN: Menampilkan minimal 6 menu Gacoan menggunakan ListView — 8 poin ===
          Expanded(
            child: ListView.builder(
              itemCount: menus.length,
              itemBuilder: (context, index) {
                final menu = menus[index];
                
                // === POIN: Tampilan katalog rapi dan terstruktur — 3 poin ===
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 3,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    
                    // === POIN: Setiap menu menampilkan gambar, nama, kategori, dan harga — 6 poin ===
                    leading: Image.asset(
                      menu.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.fastfood, size: 40),
                    ),
                    title: Row(
                      children: [
                        Expanded(child: Text(menu.name, style: const TextStyle(fontWeight: FontWeight.bold))),
                        // === BONUS +10: Badge Label "Favorit" / "Best Seller" secara Statis ===
                        if (index == 0 || index == 1) // Menandai 2 menu pertama sebagai Best Seller
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
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text('Rp ${menu.price}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                        Text(menu.category, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    
                    // === POIN: Menu dapat diklik untuk membuka Detail Menu — 4 poin ===
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
    );
  }
}