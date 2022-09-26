import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_stream/home.dart';
import 'package:todo_stream/todoProvider.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>TodoProvider(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
