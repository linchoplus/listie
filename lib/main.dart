import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'package:listie_app/screens/main_screen.dart';
import 'package:listie_app/models/task_data.dart';

import 'package:listie_app/settings/constants.dart';

//// add 'g' to file name to indicate generated
//part 'friends.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  await Hive.openBox<String>(kTaskBoxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        title: 'listie_app',
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
