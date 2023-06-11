import 'package:expense_tracker/data/expense.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<Expense> getBox() => Hive.box<Expense>('mybox');
}
