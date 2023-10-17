import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  // @override
  // State<TodoList> createState() {

  // }

  @override
  State<TodoList> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  final List<String> _toDos = <String>[];

  TodoListState() {
    _toDos.add("Si");
    _toDos.add("vis");
    _toDos.add("pacem");
    _toDos.add("para bellum");
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text("We have ${_toDos.length} TODOs"),
        backgroundColor: Theme.of(ctx).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: _getListOfTodos(ctx),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(ctx),
        tooltip: "Create new TODO",
        child: const Icon(Icons.plus_one_rounded),
      ),
    );
  }

  List<Widget> _getListOfTodos(BuildContext ctx) {
    return _toDos.asMap().entries
        .map((e) => Card(
                child: ListTile(
              title: Center(child: Text(e.value)),
              leading: const Icon(Icons.task, color: Colors.deepPurple),
              onTap: () { editTodo(ctx, e.key, e.value);},
            )))
        .toList();
  }

  void editTodo(BuildContext ctx, int idx, String text) {
    final result = Navigator.pushNamed(ctx,
    "/editTodo",
    arguments: text
    );

    result.then((value){
      setState(() {
      _toDos[idx] = value as String;
      });
    });
  }


  void _addNewTodo(String newTODO) {
    setState(() {
      _toDos.add(newTODO);
    });
  }

  Future<void> _showDialog(BuildContext ctx) {
    TextEditingController newToDoController = TextEditingController();

    return showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
              title: const Text("Add new TODO"),
              content: TextField(
                autofocus: true,
                controller: newToDoController,
              ),
              actions: [
                FloatingActionButton(
                    onPressed: () {
                      _addNewTodo(newToDoController.text);
                      Navigator.of(ctx).pop();
                    },
                    child: const Text("Add")),
                FloatingActionButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Icon(Icons.delete)),
              ],
            ));
  }
}
