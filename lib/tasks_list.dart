import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TaskData>(context).tasks.length,
      itemBuilder: (BuildContext context, index) {
        final task = Provider.of<TaskData>(context).tasks[index];
        return TaskTile(
          longPressCallBack: () {
            Provider.of<TaskData>(context, listen: false).deleteTask(task);
          },
          checkBoxCallBack: (newValue) {
            Provider.of<TaskData>(context, listen: false).updateTask(task);
          },
          task: task.name,
          ischecked: task.isDone,
        );
      },
    );
  }
}
