import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/TodoModel.dart';

import 'package:todo_flutter/screens/HomeScreen.dart';
import 'package:todo_flutter/var/string.dart';
import 'package:todo_flutter/var/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoModel(),
      child: TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: appName,
        theme: getTheme(context),
        home: HomeScreen(),
      );
}
