import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todoey/main.dart';

class TaskItem extends StatelessWidget {
  TaskItem(
      {this.isDone = false,
      this.title = 'Task Title',
      this.onChanged,
      this.onLongPress});

  final bool isDone;
  final String title;
  final Function onChanged;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        title,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null,
          decorationThickness: 4,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isDone,
        onChanged: onChanged,
      ),
    );
  }
}
