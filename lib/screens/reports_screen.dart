import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgDark,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Financial Reports',
                style: TextStyle(
                  color: AppTheme.bodaYellow,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Weekly Summary Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'THIS WEEK SUMMARY',
                      style: TextStyle(
                        color: AppTheme.bodaYellow,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Total Income: UGX 420,000',
                      style: TextStyle(
                        color: AppTheme.incomeGreen,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Total Expenses: UGX 130,000',
                      style: TextStyle(
                        color: AppTheme.expenseRed,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Net Profit: UGX 290,000',
                      style: TextStyle(
                        color: AppTheme.textWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Monthly Summary Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.cardDark,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'THIS MONTH SUMMARY',
                      style: TextStyle(
                        color: AppTheme.bodaYellow,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Total Trips: 156',
                      style: TextStyle(color: AppTheme.textWhite, fontSize: 15),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Income: UGX 1,850,000',
                      style: TextStyle(color: AppTheme.incomeGreen, fontSize: 15),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Expenses: UGX 620,000',
                      style: TextStyle(color: AppTheme.expenseRed, fontSize: 15),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Net Profit: UGX 1,230,000',
                      style: TextStyle(
                        color: AppTheme.bodaYellow,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
