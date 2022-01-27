import 'package:flutter/material.dart';
import 'screens/contact_detail/contact_detail.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      theme: _theme(),
      home: ContactDetail(),
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
