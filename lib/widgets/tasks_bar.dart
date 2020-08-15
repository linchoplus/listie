import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:listie_app/models/task_data.dart';
import 'package:listie_app/settings/constants.dart';
import 'package:listie_app/widgets/tasks_tile.dart';

class TasksBar extends StatefulWidget {
  @override
  _TasksBarState createState() => _TasksBarState();
}

class _TasksBarState extends State<TasksBar> {
  // String to boolean
  bool returnBool(String task) {
    bool newTask;
    task == 'false' ? newTask = false : newTask = true;
    return newTask;
  }

  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box<String>(kTaskBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: kSecondaryColor,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, -3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: kBorderRadius,
          ),
          child: ValueListenableBuilder(
            valueListenable: tasksBox.listenable(),
            builder: (context, Box<String> tasks, _) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  final key = tasks.keys.toList()[index];
                  final value = tasks.values.toList()[index];
                  bool isChecked = returnBool(value);
                  return TaskTile(
                    taskTitle: key,
                    isChecked: isChecked,
                    checkBoxCallback: (bool checkBoxState) {
                      isChecked = checkBoxState;

                      bool value;
                      checkBoxState ? value = true : value = false;

                      TaskData().addTask(key, isChecked);
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(key, value);

                      TaskData().mainCheckBox(checkBoxState);
                    },
                    longPressCallback: () {
                      TaskData().deleteTask(key);
                      Provider.of<TaskData>(context, listen: false)
                          .deleteTask(key);
                    },
                  );
                },
                separatorBuilder: (_, index) => Divider(),
                itemCount: TaskData().tasksCount,
              );
            },
          ),
        ),
      ),
    );
  }
}
