import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_stream/todo_model.dart';

class TodoProvider with ChangeNotifier{

  StreamController streamController=StreamController();

  List<Todo> n=[];

  addTodo(Todo todo){
    n.add(todo);
    streamController.sink.add(n);
  }

  editTodo(String id,String todo){
    final index=n.indexWhere((element) => element.id==id);
    n[index].todo=todo;
    streamController.sink.add(n);

    }

    deleteTodo(dynamic index){
    n.remove(index);
    streamController.add(n);
    }

}