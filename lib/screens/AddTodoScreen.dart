import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_flutter/models/TodoModel.dart';
import 'package:todo_flutter/widgets/FloatingCustomActionButton.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<StatefulWidget> {
  String _value = "";

  void _handleOnValueChanged(value) {
    setState(() {
      _value = value;
    });
  }

  void _handleOnAddPressed(context) {
    Provider.of<TodoModel>(context, listen: false).add(_value);
    Navigator.pop(context);
  }

  @override
  Widget build(Object context) => Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      floatingActionButton: Builder(
        builder: (scaffoldContext) => Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: FloatingCustomActionButton(
            label: 'Add',
            disabled: _value.length == 0,
            onPressed: () => this._handleOnAddPressed(scaffoldContext),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12).add(EdgeInsets.only(top: 16)),
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: false,
              decoration: InputDecoration(
                labelText: 'Remind me to...',
              ),
              onChanged: _handleOnValueChanged,
            )
          ],
        ),
      ));
}
