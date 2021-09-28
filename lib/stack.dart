
import 'package:flutter/material.dart';


class BMIResult{
  String title;
  Color color;
  String image;

  BMIResult({required this.image,required this.color,required this.title});
}


BMIResult getBMIResult(double result){
  if(result<=10){
    return BMIResult(image: 'images/weak.png', color: Colors.blueAccent, title: 'WEAK');
  }
  else if(result<=20){
    return BMIResult(image: 'images/normal.png', color: Colors.teal, title: 'GOOD');
  }
  else if(result<=30){
    return BMIResult(image: 'images/healthy.png', color: Colors.lightGreenAccent, title: 'HEALTHY');
  }
  else if(result<=40){
    return BMIResult(image: 'images/obese.png', color: Colors.yellow, title: 'OBESE');
  }
  else{
    return BMIResult(image: 'images/extremely_obese.png', color: Colors.black, title: 'EXTREME_OBESE');
  }

}


class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double length = 5;
  double weight= 60;
  double? result=0;
  BMIResult? bmiResult;
  Color backgroundColor=Colors.green;


  double calculateBMI(double length,double weight){
    return weight/(length*length)*10;
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Container(width: double.infinity,height: 400,
                color: bmiResult!=null?bmiResult!.color:Colors.pinkAccent,
                child: Column(
                  children: [
                    SizedBox(height: 40,),
                    Image.asset(bmiResult!=null?bmiResult!.image:'images/normal.png',
                      width: 100,height: 200,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Center(
                        child: Text(bmiResult!=null?bmiResult!.title:'GET Ready',
                          style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                   top: 240,
                   right: 160,
                  child: Container(width: 200,height: 300,
                    decoration: BoxDecoration(
                        color: Color(0xFF323232),
                        shape: BoxShape.circle,
                      border: Border.all(color: Colors.white,width: 15)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 110),
                      child: Column(
                        children: [
                          if(result==0)Text("Waiting",style: TextStyle(fontSize: 35,color: Colors.white),),
                          if(result!=0)Text("${result!.toStringAsFixed(2)}",style: TextStyle(fontSize: 35,color: Colors.white),),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 90,left: 50,right: 10),
                child: Row(children: [
                  Text('LENGTH',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                  SizedBox(width: 310),
                  Text('FT',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey),),
                ],),
              ),
              Slider(
                  activeColor: Colors.red,
                  inactiveColor: Colors.black,
                  min: 0,
                  max: 10,
                value: length,
                  onChanged: (abc){
                  length=abc;
                   setState(() {

                });
                  },


              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15,left: 50,right: 10,bottom: 20),
                child: Row(children: [
                  Text('Weight',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  SizedBox(width: 320),
                  Text('KG',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.grey),),
                ],),
              ),
              Slider(
                  activeColor: Colors.red,
                  inactiveColor: Colors.black,
                  min: 0,
                  max: 200,
                value: weight,
                  onChanged: (abc){
                  weight=abc;
                   setState(() {
                   });
                  },


              )
            ],
          ),
          ElevatedButton(onPressed: (){
            result=calculateBMI(length, weight);
            bmiResult=getBMIResult(result!);
            setState(() {
            });
          }, child: Text('CALCULATE'))
        ],
      ),
    );
  }
}

