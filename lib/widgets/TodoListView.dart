import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/TodoModel.dart';

class TodoListView extends StatelessWidget {
  final List<String> todoList;

  TodoListView({@required this.todoList});

  void _handleOnDismissed(BuildContext context, int index) {
    Provider.of<TodoModel>(context, listen: false).remove(index);
  }

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: EdgeInsets.only(top: 8),
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) => Dismissible(
          key: Key('${index.toString()}_${todoList[index]}'),
          direction: DismissDirection.endToStart,
          background: Container(
            padding: EdgeInsets.only(right: 12),
            color: Colors.deepOrange,
            child: Row(
              children: <Widget>[
                Icon(Icons.delete_outline, color: Colors.white)
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
          onDismissed: (direction) => this._handleOnDismissed(context, index),
          child: ListTile(
            title: Text(
              todoList[index],
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => Divider(
          indent: 12,
          endIndent: 12,
        ),
      );
}
