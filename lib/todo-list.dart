
import 'package:flutter/material.dart';

import 'startpoint.dart';

class TodoList extends StatefulWidget {
  final Task? task;
  const TodoList({Key? key,required this.task}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  var formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.lightGreenAccent,
        title: Text('Hello'),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'What people call u ',
                  border: OutlineInputBorder()
                ),
                validator: (String? value){
                    if(value!.isEmpty)
                    return "THIS FIELD IS REQUIRED";
                    else
                      return null;
                    },
                controller: name,
              ),
              SizedBox(height: 40,),
              ElevatedButton(onPressed: () {
                if(formkey.currentState!.validate()){
                  Navigator.pop(context,Task(name: name.text));
                } else{
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {

                  });
                }

              },
                  child: Text('CREATE'))
            ],
          ),
        ),
      ),
    );
  }
}
