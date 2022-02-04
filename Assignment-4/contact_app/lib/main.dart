import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import './app.dart';

Future<void> main() async {
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  runApp(const MyApp());
}
