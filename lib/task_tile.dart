import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile(
      {this.task,
      this.ischecked,
      this.checkBoxCallBack,
      this.longPressCallBack});

  String task;
  bool ischecked;
  Function checkBoxCallBack;
  Function longPressCallBack;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: GestureDetector(
          onLongPress: () {
            longPressCallBack();
          },
          child: Text(
            task,
            style: TextStyle(
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
              decoration: ischecked == true ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
        trailing: Checkbox(
          value: ischecked,
          onChanged: (value) {
            checkBoxCallBack(value);
          },
        ));
  }
}
