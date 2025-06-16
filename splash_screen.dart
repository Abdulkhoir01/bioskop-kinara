import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Controller animasi untuk fade in dan fade out
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // durasi fade in
    );

    // Tween dari 0 (tak terlihat) ke 1 (penuh terlihat)
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Jalankan fade in terlebih dahulu
    _controller.forward();

    // Setelah 2 detik (1s fade in + 1s tampil), mulai fade out
    Future.delayed(const Duration(seconds: 2), () {
      _controller.reverse(); // jalankan animasi fade out

      // Setelah animasi selesai (1 detik), navigasi ke LoginScreen
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1F3B), // warna latar belakang splash
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation, // transisi kemunculan logo
          child: Image.asset(
            'assets/images/logo111.png',
            height: 120,
          ),
        ),
      ),
    );
  }
}
