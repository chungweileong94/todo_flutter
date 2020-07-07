import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/TodoModel.dart';
import 'package:todo_flutter/var/string.dart';
import 'package:todo_flutter/widgets/AddTodoBottomSheet.dart';
import 'package:todo_flutter/widgets/TodoListView.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => AddTodoBottomSheet(),
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
