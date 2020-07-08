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
    Provider.of<TodoModel>(context, listen: false).add(_value);
    Navigator.pop(context);
  }

  @override
  Widget build(Object context) => SafeArea(
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
              actions: <Widget>[
                ...(_value.length > 0
                    ? [
                        Builder(
                          builder: (scaffoldContext) => IconButton(
                            icon: Icon(Icons.done),
                            onPressed: _value.length > 0
                                ? () =>
                                    this._handleOnAddPressed(scaffoldContext)
                                : null,
                          ),
                        )
                      ]
                    : []),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12).add(
                EdgeInsets.only(
                  top: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
              ),
              child: TextFormField(
                autofocus: false,
                decoration: InputDecoration(
                  labelText: 'Remind me to...',
                ),
                onChanged: _handleOnValueChanged,
              ),
            ),
          ],
        ),
      );
}
