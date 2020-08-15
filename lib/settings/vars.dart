// Global variables

// Main checkbox state
import 'package:listie_app/models/task_data.dart';

bool checked = initialCheckedValue;

bool get initialCheckedValue {
  int done = TaskData().tasksDone;
  int total = TaskData().tasksCount;

  if (done > 0) {
    if (done == total) {
      return true;
    }
  } else {
    return false;
  }
}
