import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:precwithbebehans/boxes.dart';
import 'package:precwithbebehans/data.dart';
import 'package:precwithbebehans/input.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataAdapter());
  dataBox = await Hive.openBox('dataBox');
  runApp(Homescreen());
}

class Homescreen extends StatelessWidget{
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
      home: Inputscreen(),
    );
  }
}