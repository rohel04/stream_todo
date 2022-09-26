import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_stream/add_todo.dart';
import 'package:todo_stream/edit_todo.dart';
import 'package:todo_stream/todoProvider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    final todoProvider=Provider.of<TodoProvider>(context);

    return Scaffold(
    appBar: AppBar(title: Text('Todo'),
    ),
    body: Container(
            child: StreamBuilder(
              stream: todoProvider.streamController.stream,
              builder: (context,snapshot){
                if(snapshot.data==null)
                {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else{
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context,index){
                            return ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>EditTodo(todo: snapshot.data[index],)));
                              },
                              title: Text('${snapshot.data?[index].id}'),
                              trailing: IconButton(onPressed: (){
                                todoProvider.deleteTodo(snapshot.data[index]);
                              },icon: Icon(Icons.delete)),
                            );
                          });
                }
              },
            ),

    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=> AddTodo()));
      },
      child: Icon(Icons.add),
      ),
    );
  }
}
