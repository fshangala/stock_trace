import 'package:flutter/material.dart';
import 'package:stock_trace/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stock Tracer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Colors.red,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red.shade500,
          foregroundColor: Colors.white,
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Colors.red,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red.shade900,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomePage(),
    );
  }
}
