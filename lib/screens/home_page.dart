import 'package:flutter/material.dart';
import '../data.dart'; // Mengambil data menu dari folder luar lib/screens
import 'detail_page.dart';
import 'profile_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Menu - Gacoan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage(username: username)),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: menus.length, // Menampilkan data secara dinamis dari data.dart
        itemBuilder: (context, index) {
          final menu = menus[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 3,
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: Image.asset(
                menu.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.fastfood, size: 40),
              ),
              title: Text(menu.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('Rp ${menu.price}', style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  Text(menu.category, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Berpindah ke Halaman Detail dengan membawa data menu yang diklik
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailPage(menu: menu)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}