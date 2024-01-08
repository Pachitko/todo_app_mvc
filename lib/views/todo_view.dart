import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:to_do_app_mvc/controllers/todo_controller.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends StateMVC<TodoView> {
  late TodoController _con;

  _TodoViewState() : super(TodoController()) {
    _con = controller as TodoController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _con.todoTitleController,
              decoration: const InputDecoration(
                labelText: "Todo Title",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _con.addTodo,
            child: const Text('Add Todo'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _con.todos.length,
              itemBuilder: (context, index) {
                final todo = _con.todos[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: Checkbox(
                    value: todo.isDone,
                    onChanged: (_) => _con.toggleTodoStatus(todo),
                  ),
                  onTap: () => _con.deleteTodo(todo),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
