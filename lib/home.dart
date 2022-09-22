import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_stream/add_todo.dart';
import 'package:todo_stream/service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> n=[];
  Stream<List<String>> asyncGenerator() async* {
    yield n;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: StreamBuilder(
        stream: asyncGenerator(),
        builder: (context,snapshot){
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context,index){
                  return ListTile(
                    title: Text('${snapshot.data?[index]}'),
                    trailing: IconButton(onPressed: (){
                      setState(() {

                      n.removeAt(index);
                      });
                      print(n);
                    },icon: Icon(Icons.delete)),
                  );
              });
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
         dynamic result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodo()));
         setState(() {
           n.add(result['todo']);
         });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
