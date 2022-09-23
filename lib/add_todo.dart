import 'dart:async';
import 'package:provider/provider.dart';
import 'package:todo_stream/todoProvider.dart';

import 'package:flutter/material.dart';

class AddTodo extends StatefulWidget {

  late StreamController streamController;
   AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {

  final _todoController=TextEditingController();

  @override
  Widget build(BuildContext context) {
  final todoProvider=Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _todoController,
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: (){
              todoProvider.addTodo(_todoController.text);
              Navigator.pop(context);
            }, child: Text('Add todo'))
            
          ],
        ),
      ),
    );
  }
}
