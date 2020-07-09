import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TodoItem {
  final String id = Uuid().v4();
  final String value;
  bool isCompleted = false;

  TodoItem(this.value);

  void markAsCompleted(bool isCompleted) {
    this.isCompleted = isCompleted;
  }
}

class TodoModel extends ChangeNotifier {
  final List<TodoItem> _todoList = [];

  UnmodifiableListView<TodoItem> get todoList =>
      UnmodifiableListView(_todoList);

  void add(TodoItem todoItem) {
    _todoList.add(todoItem);
    notifyListeners();
  }

  void remove(String id) {
    _todoList.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void flag(String id) {
    var item = _todoList.where((item) => item.id == id).first;
    item.markAsCompleted(!item.isCompleted);
    notifyListeners();
  }
}
