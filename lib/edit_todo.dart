import 'package:flutter/material.dart';


class EditTodo extends StatelessWidget {
  static const routeName = "/editTodo";

  const EditTodo({super.key});

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments;
    TextEditingController todoController = TextEditingController(text: args as String);

  return Scaffold(
    appBar: AppBar(
        title: const Text("Edit"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(autofocus: true,
          controller: todoController,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, todoController.text);
            },
          child: const Text("Edit completed"))
        ],

      ),
  );

  }

}
