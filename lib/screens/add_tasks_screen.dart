import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'package:listie_app/settings/constants.dart';
import 'package:listie_app/models/task_data.dart';
import 'package:listie_app/settings/vars.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreen createState() => _AddTaskScreen();
}

class _AddTaskScreen extends State<AddTaskScreen> {
  Box<String> tasksBox;
  final TextEditingController _keyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box<String>(kTaskBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: kBorderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: kLetterTypeSubtitle,
                color: kMainColor,
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
//              textCapitalization: TextCapitalization.characters,
              controller: _keyController,
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              color: kMainColor,
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Add',
                style: TextStyle(
                  fontFamily: kLetterTypeTitle,
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              onPressed: () {
                final key = _keyController.text;
                final bool value = false;
                if (key != '') {
                  checked = false;
                  TaskData().addTask(key, value);
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(key, value);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
