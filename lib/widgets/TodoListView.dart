import 'package:flutter/material.dart';

class TodoListView extends StatelessWidget {
  final List<String> todoList;

  TodoListView({@required this.todoList});

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: EdgeInsets.only(top: 8),
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) => ListTile(
          title: Text(
            todoList[index],
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => Divider(
          indent: 12,
          endIndent: 12,
        ),
      );
}
