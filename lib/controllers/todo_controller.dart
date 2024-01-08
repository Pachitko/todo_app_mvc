import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:to_do_app_mvc/models/todo_model.dart';

class TodoController extends ControllerMVC {
  factory TodoController() {
    _this ??= TodoController._();
    return _this!;
  }

  static TodoController? _this;

  TodoController._();

  List<Todo> todos = [];
  TextEditingController todoTitleController = TextEditingController();

  void addTodo() {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: todoTitleController.text,
    );
    todos.add(newTodo);
    todoTitleController.clear();
    refresh();
  }

  void toggleTodoStatus(Todo todo) {
    final index = todos.indexOf(todo);
    todos[index].isDone = !todos[index].isDone;
    refresh();
  }

  void deleteTodo(Todo todo) {
    todos.remove(todo);
    refresh();
  }
}
