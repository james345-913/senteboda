enum TransactionType { trip, expense }

class TransactionModel {
  final String id;
  final TransactionType type;
  final double amount;
  final DateTime date;
  final String title;
  final String? category;

  TransactionModel({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    required this.title,
    this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'amount': amount,
      'date': date.toIso8601String(),
      'title': title,
      'category': category,
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String,
      type: json['type'] == 'expense'
          ? TransactionType.expense
          : TransactionType.trip,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      category: json['category'] as String?,
    );
  }
}
