import 'package:contact_app/screens/contacts/model/user_contact.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserContactAdapter());

  runApp(const MyApp());
}
