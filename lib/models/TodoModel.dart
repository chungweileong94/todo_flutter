import 'dart:collection';

import 'package:flutter/material.dart';

class TodoModel extends ChangeNotifier {
  final List<String> _todoList = [];

  UnmodifiableListView<String> get todoList => UnmodifiableListView(_todoList);

  void add(String value) {
    _todoList.add(value);
    notifyListeners();
  }
}
