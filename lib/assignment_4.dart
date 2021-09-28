import 'dart:html';

import 'package:flutter/material.dart';
import 'package:textfield/todo-list.dart';

class Task1 extends StatefulWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  _Task1State createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  List<TaskForList> forList=[
    TaskForList()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LISTVIEW.BUILDER'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: 40,
            itemBuilder: (BuildContext context,index){
              return Card(
                child: ListTile(
                  leading: Text("njb"),
                  trailing: ElevatedButton(onPressed: (){},child: Text('D'),),
                  title: Text('Person $index'),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> TodoList()));
      },child: Icon(Icons.add),),
      
    );
  }
}

class TaskForList {
   String? name;
   String? fatherName;
   DateTime? dueDate;

}

