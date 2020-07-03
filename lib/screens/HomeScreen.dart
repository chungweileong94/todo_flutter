import 'package:flutter/material.dart';
import 'package:todo_flutter/screens/AddTodoScreen.dart';
import 'package:todo_flutter/var/string.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddTodoScreen()));
              })
        ],
      ),
    );
  }
}
