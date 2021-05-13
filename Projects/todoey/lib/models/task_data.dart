import 'package:hooks_riverpod/hooks_riverpod.dart';

class Task {
  final String title;
  bool isDone;

  Task({this.title = 'Task name', this.isDone = false});

  void toggleTask() {
    isDone = !isDone;
  }
}

class TaskData extends StateNotifier<List<Task>> {
  TaskData()
      : super([
          Task(title: 'todo-1', isDone: false),
          Task(title: 'todo-0', isDone: false),
          Task(title: 'todo-2', isDone: false),
        ]);

  void add(String title) {
    state = [...state, Task(title: title, isDone: false)];
  }

  void remove(int index) {
    state.removeAt(index);
    state = [...state];
  }
}
