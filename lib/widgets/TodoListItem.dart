import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/TodoModel.dart';

class TodoListItem extends StatelessWidget {
  final TodoItem item;

  TodoListItem(this.item);

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
  Widget build(BuildContext context) => Dismissible(
        key: Key(item.id),
        direction: DismissDirection.horizontal,
        secondaryBackground: Container(
          padding: EdgeInsets.only(right: 12),
          color: Colors.deepOrange,
          child: Row(
            children: <Widget>[Icon(Icons.delete_outline, color: Colors.white)],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ),
        background: Container(
          padding: EdgeInsets.only(left: 12),
          color: Theme.of(context).accentColor,
          child: Row(
            children: <Widget>[
              Icon(
                item.isCompleted ? Icons.undo : Icons.done,
                color: Colors.white,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
        movementDuration: Duration(milliseconds: 200),
        confirmDismiss: (direction) =>
            this._handleOnConfirmDismiss(context, direction, item.id),
        onDismissed: (direction) =>
            this._handleOnDismissed(context, direction, item.id),
        child: ListTile(
          title: Row(
            children: <Widget>[
              Visibility(
                visible: item.isCompleted,
                child: Container(
                  child: Icon(
                    Icons.check_circle,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  ),
                  margin: EdgeInsets.only(right: 12),
                ),
              ),
              Text(
                item.value,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      fontWeight: FontWeight.bold,
                      color: item.isCompleted ? Colors.grey : Colors.black,
                      decoration: item.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        ),
      );
}
