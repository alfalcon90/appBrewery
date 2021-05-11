import 'package:flutter/material.dart';
import './task_item.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(32),
      children: [TaskItem()],
    );
  }
}
