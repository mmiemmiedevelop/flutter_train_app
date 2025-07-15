import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.grey[300],
        dividerColor: Colors.grey[300],
        cardColor: Colors.grey[200],
        canvasColor: Colors.white,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: Colors.grey[900]!.withAlpha(90),
        dividerColor: Colors.grey[800],
        cardColor: Colors.grey[900]!.withAlpha(90),
        canvasColor: Colors.grey[700],
      ),
      home: const MyHomePage(),
    );
  }
}
