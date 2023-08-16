import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:object_boc_relation_test/main.dart';
import 'package:object_boc_relation_test/models/user.dart';

import '../objectbox.g.dart';

class DbSeeder {
  Future<void> userOrders() async {
    Box<User> userOrderBox = store.box<User>();

    String fileString = await rootBundle.loadString("assets/data.json");
    List fileData = jsonDecode(fileString);
    List<User> data = fileData.map((e) => User.fromJson(e)).toList();
    await userOrderBox.putManyAsync(data);
    return;
  }
}
