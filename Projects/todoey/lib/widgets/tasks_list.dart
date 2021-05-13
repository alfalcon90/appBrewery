import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todoey/main.dart';
import './task_item.dart';
import 'package:todoey/models/task_data.dart';

class TaskList extends StatefulWidget {
  TaskList({this.tasks});

  final List<Task> tasks;

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskItem(
            title: widget.tasks[index].title,
            isDone: widget.tasks[index].isDone,
            onChanged: (state) {
              setState(() {
                widget.tasks[index].toggleTask();
              });
            },
            onLongPress: () {
              context.read(tasksProvider.notifier).remove(index);
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
