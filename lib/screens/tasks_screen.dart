import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/tasks_list.dart';
import 'package:todoey/screens/add_task_screen.dart';

import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.lightBlue, // status bar color
    ));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => AddTaskScreen(
                  // addTaskCallBack: (String newTaskName) {
                  // setState(() {
                  //   Task newTask = Task(name: newTaskName);
                  //   Provider.of<TaskData>(context).tasks.add(newTask);
                  // });
                  // },
                  ));
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.lightBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 70.0, left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 28.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '${Provider.of<TaskData>(context).tasks.length} tasks',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                SizedBox(
                  height: 25.0,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Container(
                padding: EdgeInsets.only(left: 20.0),
                child: TasksList(),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
            ),
          )
        ],
      ),
    );
  }
}
