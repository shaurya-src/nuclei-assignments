// import 'package:contact_app/screens/contacts/model/contact.g.dart';
// import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(ContactAdapter());

  // await Hive.openBox<Contact>('contactsBox');

  runApp(const MyApp());
}
