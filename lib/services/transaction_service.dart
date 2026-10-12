import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transaction_model.dart';

class TransactionService extends ChangeNotifier {
  static final TransactionService _instance = TransactionService._internal();
  factory TransactionService() => _instance;

  TransactionService._internal() {
    loadTransactions();
  }

  static const String _storageKey = 'sente_boda_transactions';

  List<TransactionModel> _transactions = [
    TransactionModel(
      id: '1',
      type: TransactionType.trip,
      amount: 8000,
      date: DateTime.now(),
      title: 'Ntinda to Kisaasi',
    ),
    TransactionModel(
      id: '2',
      type: TransactionType.expense,
      amount: 9000,
      date: DateTime.now(),
      title: 'Fuel (2 litres)',
      category: 'Fuel',
    ),
    TransactionModel(
      id: '3',
      type: TransactionType.trip,
      amount: 5000,
      date: DateTime.now(),
      title: 'Kampala Rd to Wandegeya',
    ),
    TransactionModel(
      id: '4',
      type: TransactionType.expense,
      amount: 12500,
      date: DateTime.now().subtract(const Duration(days: 1)),
      title: "Owner's payment (Daily remittance)",
      category: "Owner's payment",
    ),
  ];

  List<TransactionModel> get transactions => List.unmodifiable(_transactions);

  double get totalIncome => _transactions
      .where((t) => t.type == TransactionType.trip)
      .fold(0.0, (sum, t) => sum + t.amount);

  double get totalExpenses => _transactions
      .where((t) => t.type == TransactionType.expense)
      .fold(0.0, (sum, t) => sum + t.amount);

  double get todaysProfit => totalIncome - totalExpenses;

  Future<void> loadTransactions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? jsonString = prefs.getString(_storageKey);
      if (jsonString != null && jsonString.isNotEmpty) {
        final List<dynamic> decoded = jsonDecode(jsonString);
        _transactions =
            decoded.map((item) => TransactionModel.fromJson(item)).toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error loading transactions: $e');
    }
  }

  Future<void> saveTransactions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encoded =
          jsonEncode(_transactions.map((t) => t.toJson()).toList());
      await prefs.setString(_storageKey, encoded);
    } catch (e) {
      debugPrint('Error saving transactions: $e');
    }
  }

  void addTransaction(TransactionModel transaction) {
    _transactions.insert(0, transaction);
    saveTransactions();
    notifyListeners();
  }

  static String formatCurrency(double amount) {
    final str = amount.toInt().toString();
    final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    final formatted = str.replaceAllMapped(reg, (Match m) => '${m[1]},');
    return 'UGX $formatted';
  }
}
