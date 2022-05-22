import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/contacts/view_model/contacts_provider.dart';
import 'screens/contacts/contacts.dart';

const contactsRoute = '/';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      // final arguments = settings.arguments as Map<String, dynamic>?;
      Widget screen;

      switch (settings.name) {
        case contactsRoute:
          screen = ChangeNotifierProvider<ContactsProvider>(
            create: (context) => ContactsProvider(),
            child: const Contacts(),
          );
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(),
    );
  }
}
