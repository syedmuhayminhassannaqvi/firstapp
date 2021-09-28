import 'package:flutter/material.dart';
class SliderDemo extends StatefulWidget {
  const SliderDemo({Key? key}) : super(key: key);

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double Weight = 20.0;
  double height = 5.0;
  double result = 0;
  
  double CalculatorBmi(double height,double weight){
    return (weight/(height*height))*10;
  }

  String AverageCal(double result){
    if(result<=20){
       return "Normal";
    }
      else if(result<=30){
        return 'over';
    }
      else if(result<=40){
        return 'fat';
    }
      else{
        return 'Operation required';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color(0xFF090e21),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: Color(0xFF1d1e34),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 9,),
                    Text('HEIGHT',style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey
                    ),),
                    Row(
                      children: [
                        SizedBox(width: 170,),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Text('${height.toStringAsFixed(2)}',style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                        ),
                      ],
                    ),
                    Slider(value: height,
                        min: 0.0,
                        max: 10.0,
                        onChanged: (abc){
                          height=abc;
                          setState(() {

                          });
                        })

                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: Color(0xFF1d1e34),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    SizedBox(height: 9,),
                    Text('WEIGHT',style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey
                    ),),

                    Row(
                      children: [
                        SizedBox(width: 170,),
                        Text("${Weight.toStringAsFixed(2)}",style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),

                      ],
                    ),
                    Slider(value: Weight,
                        min: 0.0,
                        max: 200.0,
                        divisions: 100,
                        onChanged: (abc){
                          Weight=abc;
                          setState(() {

                          });
                        })
                  ],
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 70,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  result=CalculatorBmi(height, Weight);
                  setState(() {});
                },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFeb1455),

                    ),
                    child: Text('CALCULATE',style: TextStyle(
                  fontSize: 40,
                  color: Colors.white
                ),)),
              ),
              SizedBox(height: 30,),
              if(result!=0) Text("${result.toStringAsFixed(2)}",style: TextStyle(fontSize: 20,
              color: Colors.white
          ),),
             SizedBox(height: 15,),
             if(result!=0) Text(AverageCal(result),
                style: TextStyle(color: Colors.red,fontSize: 15),)
            ],
          ),
        ),
      ),
    );

  }
}

