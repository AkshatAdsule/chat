import 'package:chat/screens/chat_home.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? light, ColorScheme? dark) => MaterialApp(
        theme: ThemeData(
          colorScheme: light,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: dark,
          useMaterial3: true,
        ),
        home: const ChatHomeScreen(),
      ),
    );
  }
}
