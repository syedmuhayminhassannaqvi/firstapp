import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  var height = TextEditingController();
  var weight = TextEditingController();
  var formkey = GlobalKey<FormState>();
  var Bmi;
  String? endvalue;
  double cal(double height,double weight){
    return weight/ (height*height);
  }
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              controller: height,
              validator: (String? value){
                if(value!.isEmpty){
                  return 'yours height is req';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "username"
              ),
            ),
            TextFormField(
              controller: weight,
              keyboardType: TextInputType.number,
              validator: (String? value){
                if(value!.isEmpty){
                  return 'yours password is req';
                }
                else if(value.length<1){
                  return 'req weight';
                }
              },
              decoration: InputDecoration(
                  labelText: "username"
              ),
            ),
            ElevatedButton(onPressed: (){

              if(formkey.currentState!.validate()){
                double parsedweight = double.parse(weight.text);
                double parsedheight = double.parse(height.text);
                endvalue=cal(parsedheight, parsedweight).toString();
                setState(() {
                });
              }
              else{
                autovalidateMode = AutovalidateMode.always;

              }
            }, child: Text('Sign in')),
            SizedBox(height: 40,),
            if(endvalue != null) Text(endvalue!)
          ],
        ),
      ),
    );
  }
}
