import 'dart:io';

import 'package:flutter/material.dart';
import 'package:object_boc_relation_test/methods/data_seeder.dart';
import 'package:object_boc_relation_test/objectbox.g.dart';
import 'package:object_boc_relation_test/ui/test_page.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

late Store store;
Admin? _admin;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// prepare directory
  Directory? directory = await getApplicationDocumentsDirectory();
  String path = directory.path;
  path = p.join(path, "DbTest");

  store = await openStore(directory: path);

  /// run admin view if available
  if (Admin.isAvailable()) {
    _admin = Admin(store);
  }

  /// seed the data to the tables
  await DbSeeder().userOrders();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TestPage(),
    );
  }
}
