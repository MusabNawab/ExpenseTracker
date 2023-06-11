import 'package:expense_tracker/data/categories.dart';
import 'package:expense_tracker/data/expense.dart';
import 'package:expense_tracker/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseAdapter());
  Hive.registerAdapter(CategoriesAdapter());
  await Hive.openBox<Expense>('mybox');
  runApp(const MyApp());
}

final kColorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
final kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 129, 71, 230));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        useMaterial3: true,
        chipTheme: const ChipThemeData().copyWith(
            backgroundColor: kDarkColorScheme.inversePrimary, elevation: 2),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.onPrimaryContainer, elevation: 2),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        useMaterial3: true,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.inversePrimary,
          foregroundColor: kColorScheme.inverseSurface,
        ),
        chipTheme: const ChipThemeData().copyWith(
            backgroundColor: kColorScheme.inversePrimary, elevation: 2),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer, elevation: 2),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
