import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16.0),
          bodyMedium: TextStyle(fontSize: 14.0),
          bodySmall: TextStyle(fontSize: 10.0),
          displayLarge: TextStyle(fontSize: 32.0),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: const Color(0xFF1B4DFF),
          onPrimary: Colors.black,
          secondary: const Color(0xFFB4C4FF),
          onSecondary: Colors.grey,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
