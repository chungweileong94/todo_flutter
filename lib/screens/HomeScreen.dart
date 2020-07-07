import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/TodoModel.dart';
import 'package:todo_flutter/screens/AddTodoScreen.dart';
import 'package:todo_flutter/var/string.dart';
import 'package:todo_flutter/widgets/TodoListView.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => AddTodoScreen()),
                );
              })
        ],
      ),
      body: Consumer<TodoModel>(builder: (context, value, child) {
        final todoList = value.todoList;
        return TodoListView(todoList: todoList);
      }),
    );
  }
}
