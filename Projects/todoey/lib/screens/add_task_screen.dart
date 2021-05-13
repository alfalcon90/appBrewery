import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({this.onSubmit});

  final Function onSubmit;
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 24,
        ),
        child: Column(
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 28,
              ),
            ),
            TextField(
              controller: inputController,
              style: TextStyle(),
              autofocus: true,
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  onSubmit(inputController.text);
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
