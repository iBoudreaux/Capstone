import 'package:flutter/material.dart';
import 'package:signlanguageapp/Pages/welcomepages/welcomepage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('storagebox');

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sign The Way',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

