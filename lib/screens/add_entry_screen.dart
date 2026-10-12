import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../services/transaction_service.dart';
import '../theme/app_theme.dart';

class AddEntryScreen extends StatefulWidget {
  final Function(int targetIndex)? onSaveSuccess;

  const AddEntryScreen({super.key, this.onSaveSuccess});

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {
  bool isTripSelected = true;
  String selectedCategory = 'Fuel';
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  final List<String> categories = [
    'Fuel',
    'Repairs',
    'Fine',
    "Owner's payment",
    'Other'
  ];

  void _handleSave() {
    final amountText = _amountController.text.trim();
    if (amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an amount')),
      );
      return;
    }

    final amount = double.tryParse(amountText);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
      return;
    }

    final title = _noteController.text.trim().isEmpty
        ? (isTripSelected ? 'Trip' : selectedCategory)
        : _noteController.text.trim();

    final newTransaction = TransactionModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: isTripSelected ? TransactionType.trip : TransactionType.expense,
      amount: amount,
      date: DateTime.now(),
      title: title,
      category: isTripSelected ? null : selectedCategory,
    );

    TransactionService().addTransaction(newTransaction);

    final type = isTripSelected ? 'Trip' : 'Expense';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$type saved to History!'),
        backgroundColor: AppTheme.primaryGreen,
        duration: const Duration(seconds: 2),
      ),
    );

    _amountController.clear();
    _noteController.clear();

    // Automatically navigate to History tab (index 2) so the rider immediately sees their newly added transaction in History!
    if (widget.onSaveSuccess != null) {
      widget.onSaveSuccess!(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgDark,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              const Text(
                'Add Entry',
                style: TextStyle(
                  color: AppTheme.bodaYellow,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Trip vs Expense Toggle
              Container(
                height: 50,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppTheme.cardDark,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => isTripSelected = true),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isTripSelected
                                ? AppTheme.bodaYellow
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'TRIP',
                            style: TextStyle(
                              color: isTripSelected
                                  ? AppTheme.primaryGreen
                                  : AppTheme.textGray,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => isTripSelected = false),
                        child: Container(
                          decoration: BoxDecoration(
                            color: !isTripSelected
                                ? AppTheme.bodaYellow
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'EXPENSE',
                            style: TextStyle(
                              color: !isTripSelected
                                  ? AppTheme.primaryGreen
                                  : AppTheme.textGray,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              const Text(
                'Amount (UGX)',
                style: TextStyle(color: AppTheme.textWhite, fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: AppTheme.textWhite),
                decoration: InputDecoration(
                  hintText: 'e.g. 8000',
                  hintStyle: const TextStyle(color: AppTheme.textGray),
                  filled: true,
                  fillColor: AppTheme.inputBg,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              if (!isTripSelected) ...[
                const SizedBox(height: 16),
                const Text(
                  'Expense Category',
                  style: TextStyle(color: AppTheme.textWhite, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppTheme.inputBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCategory,
                      dropdownColor: AppTheme.cardDark,
                      isExpanded: true,
                      style: const TextStyle(color: AppTheme.textWhite),
                      items: categories
                          .map((cat) => DropdownMenuItem(
                                value: cat,
                                child: Text(cat),
                              ))
                          .toList(),
                      onChanged: (val) {
                        if (val != null) {
                          setState(() => selectedCategory = val);
                        }
                      },
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 16),
              Text(
                isTripSelected ? 'Destination / Note' : 'Note',
                style: const TextStyle(color: AppTheme.textWhite, fontSize: 14),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _noteController,
                style: const TextStyle(color: AppTheme.textWhite),
                decoration: InputDecoration(
                  hintText: isTripSelected
                      ? 'e.g. Ntinda to Kisaasi'
                      : 'e.g. 2 litres fuel',
                  hintStyle: const TextStyle(color: AppTheme.textGray),
                  filled: true,
                  fillColor: AppTheme.inputBg,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _handleSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.bodaYellow,
                  foregroundColor: AppTheme.primaryGreen,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  isTripSelected ? 'SAVE TRIP' : 'SAVE EXPENSE',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
