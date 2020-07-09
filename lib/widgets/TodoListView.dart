import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/TodoModel.dart';
import 'package:uuid/uuid.dart';

class TodoListView extends StatelessWidget {
  final List<TodoItem> todoList;

  TodoListView({@required this.todoList});

  void _handleOnDismissed(
    BuildContext context,
    DismissDirection direction,
    String id,
  ) {
    if (direction == DismissDirection.endToStart) {
      Provider.of<TodoModel>(context, listen: false).remove(id);

      Scaffold.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
        content: Row(
          children: <Widget>[
            Container(
              child: Icon(Icons.info_outline),
              margin: EdgeInsets.only(right: 8),
            ),
            Text('Item Removed'),
          ],
        ),
      ));
    }
  }

  Future<bool> _handleOnConfirmDismiss(
    BuildContext context,
    DismissDirection direction,
    String id,
  ) {
    switch (direction) {
      case DismissDirection.startToEnd:
        Provider.of<TodoModel>(context, listen: false).flag(id);
        return Future.value(false);

      case DismissDirection.endToStart:
        return Future.value(true);

      default:
        return Future.value(false);
    }
  }

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: EdgeInsets.only(top: 8),
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) {
          final todoItem = todoList[index];

          return Dismissible(
            key: Key(todoItem.id),
            direction: DismissDirection.horizontal,
            secondaryBackground: Container(
              padding: EdgeInsets.only(right: 12),
              color: Colors.deepOrange,
              child: Row(
                children: <Widget>[
                  Icon(Icons.delete_outline, color: Colors.white)
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            ),
            background: Container(
              padding: EdgeInsets.only(left: 12),
              color: todoItem.isCompleted ? Colors.orange : Colors.lightGreen,
              child: Row(
                children: <Widget>[
                  Icon(
                    todoItem.isCompleted ? Icons.undo : Icons.done_outline,
                    color: Colors.white,
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
            movementDuration: Duration(milliseconds: 200),
            confirmDismiss: (direction) =>
                this._handleOnConfirmDismiss(context, direction, todoItem.id),
            onDismissed: (direction) =>
                this._handleOnDismissed(context, direction, todoItem.id),
            child: ListTile(
              title: Text(
                todoItem.value,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: todoItem.isCompleted ? Colors.grey : Colors.black,
                      decoration: todoItem.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          indent: 12,
          endIndent: 12,
        ),
      );
}
