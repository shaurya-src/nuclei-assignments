import 'package:flutter/material.dart';
import 'screens/contacts/contacts.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: _theme(),
      home: const Contacts(),
    );
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
      ),
    );
  }
}
