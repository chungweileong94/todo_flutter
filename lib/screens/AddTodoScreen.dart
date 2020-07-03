import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  void _handleOnAddPresses(context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Work in Progress...'),
        behavior: SnackBarBehavior.fixed,
      ),
    );
  }

  @override
  Widget build(Object context) => Scaffold(
        appBar: AppBar(
          title: Text('Add Todo'),
        ),
        floatingActionButton: Builder(
          builder: (scaffoldContext) => Container(
            margin: EdgeInsets.only(bottom: 12),
            child: FloatingActionButton.extended(
              icon: Icon(Icons.add),
              label: Text('Add'),
              onPressed: () => this._handleOnAddPresses(scaffoldContext),
            ),
          ),
        ),
      );
}
