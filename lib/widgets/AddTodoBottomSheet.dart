import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_flutter/models/TodoModel.dart';

class AddTodoBottomSheet extends StatefulWidget {
  @override
  _AddTodoBottomSheetState createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<StatefulWidget> {
  String _value = "";

  void _handleOnValueChanged(value) {
    setState(() {
      _value = value;
    });
  }

  void _handleOnAddPressed(context) {
    Provider.of<TodoModel>(context, listen: false).add(TodoItem(_value));
    Navigator.pop(context);
  }

  @override
  Widget build(Object context) => SafeArea(
        child: Container(
          padding: EdgeInsets.all(12).add(
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                title: const Text(
                  'Add Todo',
                  style: TextStyle(color: Colors.black),
                ),
                centerTitle: true,
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Container(),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 16,
                  bottom: 12,
                ),
                child: TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.bubble_chart),
                    labelText: 'Remind me to...',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  onChanged: _handleOnValueChanged,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Builder(
                  builder: (scaffoldContext) => OutlineButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Icon(Icons.add),
                          margin: EdgeInsets.only(right: 8),
                        ),
                        Text(
                          'Add',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    onPressed: _value.length > 0
                        ? () => this._handleOnAddPressed(scaffoldContext)
                        : null,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
