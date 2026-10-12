import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Settings',
                style: TextStyle(
                  color: AppTheme.bodaYellow,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.cardDark,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Currency',
                      style: TextStyle(
                        color: AppTheme.bodaYellow,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'UGX - Uganda Shilling',
                      style: TextStyle(color: AppTheme.textWhite, fontSize: 16),
                    ),
                    Divider(color: AppTheme.inputBg, height: 24),
                    Text(
                      'Notifications',
                      style: TextStyle(
                        color: AppTheme.bodaYellow,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Enabled',
                      style: TextStyle(color: AppTheme.textWhite, fontSize: 16),
                    ),
                    Divider(color: AppTheme.inputBg, height: 24),
                    Text(
                      'About Sente Boda',
                      style: TextStyle(
                        color: AppTheme.bodaYellow,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Version 1.0 (Build 2026)',
                      style: TextStyle(color: AppTheme.textWhite, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
