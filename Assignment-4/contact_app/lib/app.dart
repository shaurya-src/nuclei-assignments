import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/contacts/view_model/contacts_provider.dart';
import 'screens/contacts/contacts.dart';
import 'screens/contact_detail/contact_detail.dart';

const contactsRoute = '/';
const contactDetailRoute = '/contact_detail';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final arguments = settings.arguments as Map<String, dynamic>?;
      Widget screen;

      switch (settings.name) {
        case contactsRoute:
          // screen = const Contacts();
          screen = ChangeNotifierProvider<ContactsProvider>(
            create: (context) => ContactsProvider(),
            child: const Contacts(),
          );
          break;
        case contactDetailRoute:
          screen = ContactDetail(arguments!['contact']);
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
