import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:hive/hive.dart';

import 'package:listie_app/settings/constants.dart';
import 'package:listie_app/settings/vars.dart';

Box<String> tasksBox = Hive.box<String>(kTaskBoxName);

class TaskData extends ChangeNotifier {
  int get tasksCount {
    List _tasksList = tasksBox.keys.toList();
    return _tasksList.length;
  }

  int get tasksDone {
    int _tasksDone = 0;
    for (var index = 0; index < tasksBox.length; index++) {
      if (tasksBox.getAt(index) == 'true') {
        _tasksDone++;
      }
    }
    return _tasksDone;
  }

  void addTask(String key, bool isChecked) {
    tasksBox.put(key, '$isChecked');
    notifyListeners();
  }

  void deleteTask(String key) {
    tasksBox.delete(key);
    notifyListeners();
  }

  void selectAll() {
    for (var index = 0; index < tasksBox.length; index++) {
      String key = tasksBox.keyAt(index);
      tasksBox.put(key, 'true');
    }
    notifyListeners();
  }

  void deselectAll() {
    for (var index = 0; index < tasksBox.length; index++) {
      String key = tasksBox.keyAt(index);
      tasksBox.put(key, 'false');
//      String value = tasksBox.get(key);
    }
    notifyListeners();
  }

  void deleteSelected() {
    String key;
    String value;
    for (var index = 0; index < tasksBox.length; index++) {
      key = tasksBox.keyAt(index);
      value = tasksBox.get(key);
      if (value == 'true') {
        index--;
        deleteTask(key);
      }
    }
    notifyListeners();
  }

  void mainCheckBox(bool value) {
    int done = tasksDone;
    int total = tasksCount;

    if (value) {
//      print('value is $value');
//      print('checked is $checked');
      if (done == total) {
        if (total > 0) {
          checked = true;
//          print('done: $done, total: $total, checked: $checked, total: $total');
        }
      }
    } else {
      checked = false;
//      print('value is $value');
//      print('checked is $checked');
    }
  }
}
