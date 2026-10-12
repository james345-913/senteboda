import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../services/transaction_service.dart';
import '../theme/app_theme.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _filterIndex = 0; // 0: All, 1: Trips, 2: Expenses

  @override
  Widget build(BuildContext context) {
    final service = TransactionService();

    return Scaffold(
      backgroundColor: AppTheme.bgDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Transaction History',
                style: TextStyle(
                  color: AppTheme.bodaYellow,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Filter Tabs
              Row(
                children: [
                  _buildFilterTab(0, 'All'),
                  const SizedBox(width: 8),
                  _buildFilterTab(1, 'Trips'),
                  const SizedBox(width: 8),
                  _buildFilterTab(2, 'Expenses'),
                ],
              ),
              const SizedBox(height: 16),

              Expanded(
                child: ListenableBuilder(
                  listenable: service,
                  builder: (context, _) {
                    final allList = service.transactions;
                    final filteredList = allList.where((item) {
                      if (_filterIndex == 1) {
                        return item.type == TransactionType.trip;
                      } else if (_filterIndex == 2) {
                        return item.type == TransactionType.expense;
                      }
                      return true;
                    }).toList();

                    if (filteredList.isEmpty) {
                      return const Center(
                        child: Text(
                          'No transactions found.',
                          style: TextStyle(color: AppTheme.textGray),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final item = filteredList[index];
                        return _buildHistoryItem(item);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTab(int index, String label) {
    final isSelected = _filterIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _filterIndex = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.bodaYellow : AppTheme.cardDark,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? AppTheme.primaryGreen : AppTheme.textGray,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryItem(TransactionModel item) {
    final isTrip = item.type == TransactionType.trip;
    final dateStr =
        '${item.date.day.toString().padLeft(2, '0')}/${item.date.month.toString().padLeft(2, '0')}/${item.date.year}';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.primaryGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                isTrip ? '+' : '-',
                style: TextStyle(
                  color: isTrip ? AppTheme.incomeGreen : AppTheme.expenseRed,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    color: AppTheme.textWhite,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  dateStr,
                  style: const TextStyle(
                    color: AppTheme.textGray,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            TransactionService.formatCurrency(item.amount),
            style: TextStyle(
              color: isTrip ? AppTheme.incomeGreen : AppTheme.expenseRed,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
