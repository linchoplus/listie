import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

import 'package:listie_app/settings/constants.dart';


class TaskTile extends StatelessWidget {
  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxCallback,
      this.longPressCallback});

  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallback;
  final Function longPressCallback;

  final Box<String> tasksBox = Hive.box<String>(kTaskBoxName);

  @override
  Widget build(BuildContext context) {
    return ListTile(
//      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
      dense: true,
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(3, 3), // changes position of shadow
            ),
          ],
          decoration: isChecked ? TextDecoration.lineThrough : null,
          fontFamily: kLetterTypeSubtitle,
          fontSize: 25.0,
//          color: Colors.white,
        ),
      ),
      trailing: Checkbox(
        activeColor: kCheckBoxColor,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
