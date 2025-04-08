import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TodoListPage(),
  ));
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<String> todos = [];
  TextEditingController todoController = TextEditingController();

  void addTodo() {
    setState(() {
      String todo = todoController.text;
      if (todo.isNotEmpty) {
        todos.add(todo);
        todoController.clear();
      }
    });
  }

  void removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Goals', style: TextStyle(fontFamily: "OpenSans-VariableFont_wdth,wght")),
        backgroundColor: Colors.purple, // Set the app bar color to purple
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card( // Wrap the input field in a Card for round corners
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Add round corners
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: todoController,
                        decoration: const InputDecoration(
                          hintText: 'Add a goal',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: addTodo,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Card( // Wrap each task in a Card for round corners
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0), // Add round corners
                  ),
                  elevation: 4, // Add a shadow
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(todos[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => removeTodo(index),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
