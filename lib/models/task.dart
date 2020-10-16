import 'package:flutter/material.dart';

class Task {
  String name;
  bool isDone = false;

  Task({this.name, this.isDone = false});

  void toggle() {
    isDone = !isDone;
  }
}
