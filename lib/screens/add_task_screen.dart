import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final textFieldController = TextEditingController();
  String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Text(
                'Add Task',
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: TextField(
                controller: textFieldController,
                onChanged: (value) {
                  newTaskTitle = value;
                },
                style: TextStyle(
                    fontFamily: 'Raleway', fontWeight: FontWeight.w900),
                autofocus: true,
                textAlign: TextAlign.center,
              ),
            ),
            FlatButton(
              onPressed: () {
                textFieldController.clear();
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle);
                Navigator.pop(context);
              },
              color: Colors.lightBlue,
              child: Container(
                width: double.infinity,
                color: Colors.lightBlue,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'ADD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0))),
      ),
      color: Color(0xFF757575),
    );
  }
}
