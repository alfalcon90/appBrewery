import 'package:flutter/material.dart';
import 'screens/tasks_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'models/task_data.dart';
import 'package:todoey/models/task_data.dart';

final tasksProvider =
    StateNotifierProvider<TaskData, List<Task>>((ref) => TaskData());

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
        ),
      ),
    );
  }
}
