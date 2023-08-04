import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/tabs_screen.dart';

void main() async {
  await dotenv.load();
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 47, 72, 92),
            brightness: Brightness.dark,
            surface: const Color.fromARGB(255, 4, 4, 4),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 4, 4, 4)),
      home: const TabsScreen(),
    ),
  );
}
