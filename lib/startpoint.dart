import 'dart:html';

import 'package:flutter/material.dart';
import 'package:textfield/demo_2.dart';
import 'package:textfield/todo-list.dart';

class Task1 extends StatefulWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  _Task1State createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  List<Task> task=[
    Task(name: 'Muhaymin'),
    Task(name: 'Ali'),
    Task(name: 'Adnan'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTVIEW.BUILDER'),
      ),
      body: ListView.builder(
          itemCount: task.length,
          itemBuilder:(BuildContext context,i){
            Task _task = task[i];
            return Card(
              elevation: 17,
              child: ListTile(
                onTap: (){
                },
                title: Text(_task.name.toString()),
                leading: Text((i+1).toString()),
                trailing: IconButton(onPressed: (){
                  task.removeAt(i);
                  setState(() {
                    
                  });
                },
                    icon: Icon(Icons.delete)),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        Task? response = await Navigator.push(context, MaterialPageRoute(builder: (context)=> TodoList(task: null,)));
        if(response!=null)
          task.add(response);
        setState(() {

        });
      },child: Icon(Icons.add),),
      
    );
  }
}

class Task {
   String? name;
   Task({required this.name});
}

