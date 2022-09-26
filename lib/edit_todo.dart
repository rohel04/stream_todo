import 'dart:async';
import 'package:provider/provider.dart';
import 'package:todo_stream/todoProvider.dart';
import 'package:flutter/material.dart';
import 'package:todo_stream/todo_model.dart';

class EditTodo extends StatefulWidget {


  Todo todo;
  EditTodo({Key? key,required this.todo}) : super(key: key);

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _todoController.text=widget.todo.todo;
  }

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
              todoProvider.editTodo(widget.todo.id,_todoController.text);
              Navigator.pop(context);
            }, child: Text('Add todo'))

          ],
        ),
      ),
    );
  }
}
