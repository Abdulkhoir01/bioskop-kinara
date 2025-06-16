import 'package:flutter/material.dart'; // Library utama untuk membangun UI Flutter.
import 'package:firebase_core/firebase_core.dart'; // Untuk menginisialisasi Firebase di aplikasi.
import 'firebase_options.dart'; //Berisi konfigurasi Firebase spesifik untuk platform Android/iOS.
import 'screens/splash_screen.dart'; //tampilan pertama saat buka aplikasi

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );// Mengaktifkan Firebase menggunakan opsi default
  runApp(const BioskopApp());
}

class BioskopApp extends StatelessWidget {
  const BioskopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Bioskop',
      debugShowCheckedModeBanner: false, //Menghilangkan label debug di pojok kanan atas.
      theme: ThemeData(primarySwatch: Colors.red),
      home: const SplashScreen(), // Mulai dari Splash
    );
  }
}
