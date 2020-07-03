import 'package:flutter/material.dart';

import 'package:todo_flutter/screens/HomeScreen.dart';
import 'package:todo_flutter/var/string.dart';
import 'package:todo_flutter/var/theme.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appName,
        theme: theme,
        home: HomeScreen(),
      );
}
