import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'package:listie_app/models/task_data.dart';
import 'package:listie_app/Screens/confirm_delete_screen.dart';
import 'package:listie_app/settings/constants.dart';
import 'package:listie_app/settings/vars.dart';

class CounterBar extends StatefulWidget {
  @override
  _CounterBarState createState() => _CounterBarState();
}

class _CounterBarState extends State<CounterBar> {
  Box<String> tasksBox;

  @override
  void initState() {
    super.initState();
    tasksBox = Hive.box<String>(kTaskBoxName);
  }

  @override
  Widget build(BuildContext context) {
    int numberOfTasks = Provider.of<TaskData>(context).tasksCount;
    int numberOfTasksDone = Provider.of<TaskData>(context).tasksDone;
    String counterString = '$numberOfTasksDone of $numberOfTasks tasks done';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
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
            color: kSecondaryColor,
            borderRadius: kBorderRadius,
          ),
          child: ListTile(
            onLongPress: () {
              if (numberOfTasksDone > 0) {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: ConfirmDelete(),
                  ),
                );
              }
            },
            title: Text(
              counterString,
              style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ],
                fontFamily: kLetterTypeSubtitle,
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
            trailing: Checkbox(
              value: checked,
              onChanged: (bool newValue) {
                if (numberOfTasks > 0) {
                  setState(() {
                    checked = newValue;
                    checked ? TaskData().selectAll() : TaskData().deselectAll();
                  });
                }
              },
//                      checkColor: Colors.blueGrey,
              activeColor: kCheckBoxColor,
            ),
          ),
        ),
      ],
    );
  }
}
