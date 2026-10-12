import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '🚲',
              style: TextStyle(fontSize: 72),
            ),
            SizedBox(height: 16),
            Text(
              'Sente Boda',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: AppTheme.bodaYellow,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Every shilling, on record.',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: AppTheme.textGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
