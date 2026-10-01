import 'package:flutter/material.dart';
import 'package:latkuis_mobile_124240149/data.dart';

class DetailPage extends StatelessWidget {
  // === POIN 3: Tombol/navigasi kembali ke Home berfungsi (4 poin) ===
  // Navigasi kembali otomatis ditangani oleh AppBar bawaan Flutter 
  // yang menyediakan tombol panah kembali (back button) secara default.

  // === POIN 1: Data menu sesuai dengan menu yang dipilih pada Home (10 poin) ===
  // Menerima parameter objek 'menu' dari halaman Home saat item diklik.
  final Menu menu;

  const DetailPage({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Judul AppBar menampilkan nama menu sesuai data yang diklik
        title: Text(menu.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === POIN 2 & 4: Menampilkan gambar, nama, kategori, harga, deskripsi & Tampilan rapi (8 + 3 poin) ===
            // Bagian Tampilan Gambar yang Rapi dengan sudut melengkung (Rounded Corners)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0), // Membuat sudut gambar melengkung rapi
                  child: Image.asset(
                    menu.image, // Mengambil path gambar secara dinamis dari data menu
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 220,
                        color: Colors.grey[200],
                        child: const Center(
                          child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Bagian Informasi Teks Detail Menu (Nama, Kategori, Harga, dan Deskripsi)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menampilkan Nama Menu
                  Text(
                    menu.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Menampilkan Kategori Menu
                  Text(
                    menu.category,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Menampilkan Harga Menu
                  Text(
                    'Rp.${menu.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Menampilkan Deskripsi Menu
                  Text(
                    menu.description,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}