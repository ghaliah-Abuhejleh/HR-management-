import 'package:flutter/material.dart';
import 'notification_page.dart';

void main() {
  runApp(
     const MyApp(),
  );
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
          bodyLarge: const TextStyle(fontSize: 16.0),
          bodyMedium: const TextStyle(fontSize: 14.0),
          bodySmall: const TextStyle(fontSize: 10.0),
          displayLarge: const TextStyle(fontSize: 32.0),
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
      home: const NotificationPage(),
    );
  }
}
