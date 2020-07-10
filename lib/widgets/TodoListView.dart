import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter/models/TodoModel.dart';
import 'package:todo_flutter/widgets/TodoListItem.dart';

class TodoListView extends StatelessWidget {
  final List<TodoItem> todoList;

  TodoListView({@required this.todoList});

  Widget _renderEmpty() => Container(
        padding: EdgeInsets.symmetric(horizontal: 40).add(
          EdgeInsets.only(bottom: 50),
        ),
        child: FlareActor(
          "assets/Empty.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          antialias: true,
          animation: 'empty',
        ),
      );

  Widget _renderList() => ListView.separated(
        padding: EdgeInsets.only(top: 8),
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) => TodoListItem(
          todoList[index],
        ),
        separatorBuilder: (BuildContext context, int index) => Divider(
          indent: 12,
          endIndent: 12,
        ),
      );

  @override
  Widget build(BuildContext context) {
    if (todoList.length == 0) {
      return _renderEmpty();
    }

    return _renderList();
  }
}
