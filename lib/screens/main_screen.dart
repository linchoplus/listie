import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:listie_app/settings/constants.dart';
import 'package:listie_app/widgets/top_bar.dart';
import 'package:listie_app/widgets/counter_bar.dart';
import 'package:listie_app/widgets/tasks_bar.dart';


class MainScreen extends StatefulWidget {
  @override
  _TasksScreen createState() => _TasksScreen();
}

class _TasksScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TopBar(),
            CounterBar(),
            TasksBar(),
          ],
        ),
      ),
    );
  }
}
