import 'dart:async';

import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier{

  StreamController streamController=StreamController();

  List<String> n=[];

  addTodo(String todo){
    n.add(todo);
    streamController.sink.add(n);
    print(n);
  }

}