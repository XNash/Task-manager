import 'package:flutter/material.dart';
import 'package:test0/data/database/online/dbHelper/mongodb.dart';
import 'package:test0/ui/view/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MongoDatabase.connect();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}
