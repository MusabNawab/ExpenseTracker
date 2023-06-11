import 'package:expense_tracker/data/categories.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'expense.g.dart';

const uuid = Uuid();

final categoryIcons = {
  Categories.food: Icons.dining_rounded,
  Categories.travel: Icons.flight,
  Categories.entertainment: Icons.movie,
  Categories.health: Icons.favorite,
  Categories.others: Icons.more_horiz_rounded
};

@HiveType(typeId: 2)
class Expense extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final Categories ct;
  @HiveField(4)
  final DateTime dt;

  Expense(
      {required this.id,
      required this.title,
      required this.amount,
      required this.dt,
      required this.ct});
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
      : expenses =
            allExpense.where((expense) => expense.ct == category).toList();

  final Categories category;
  List<Expense> expenses;

  double get total {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
