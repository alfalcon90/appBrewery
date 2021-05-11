import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'task',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
          decorationThickness: 4,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value;
          });
        },
      ),
    );
  }
}
