import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app/secondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter=60;
  var BMI=(((60/(1.7*1.7))*100).roundToDouble())/100;
  var bmi;
  void _incrementCounter(){
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }
  void calculateBMI(){
    setState(() {
      BMI=_counter*10000/(height*height);
      BMI=BMI*100;
      BMI=BMI.roundToDouble();
      BMI=BMI/100;
    });
  }
  void gotopage(){
    calculateBMI();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>secondPage(BMI:BMI)));
  }

  @override
  var height= 170.0;
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text("BMI Calculator",style: TextStyle(
          fontSize: 30, fontWeight:FontWeight.bold
        ),),
        centerTitle: true,
        foregroundColor: Colors.red,
        backgroundColor: Colors.yellow,
      ),
      body:
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:[
        Container(
          height:600,
          width:200,
          color:Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Height (in cm):",style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 28
              ),),
              Slider(value:height, onChanged: (value){
                setState(() {
                  height=value.roundToDouble();
                  var x=height*height;
                });
              },min: 60,max: 230,
                activeColor: Colors.deepOrangeAccent,
                inactiveColor: Colors.white,
                thumbColor: Colors.black,
              ),
              Text(height.toString(),style:TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20
              )
              )
            ],
          )
        ),
        Container(
          height:600,
          width:200,
          color:Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Weight (in kg):",style:TextStyle(
                fontSize: 28,
                fontStyle: FontStyle.italic
              )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                SizedBox(
                  height:45 ,
                  width:45 ,
                  child: ElevatedButton(
                    onPressed: _incrementCounter,
                    child: Text("+",style: TextStyle(fontSize: 26),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                        foregroundColor: MaterialStatePropertyAll(Colors.white)
                    ),
                  ),
                ),
                SizedBox(
                  height:45 ,
                  width:45,
                  child: ElevatedButton(
                    onPressed: _decrementCounter,
                    child: Text('-',style: TextStyle(fontSize: 26),),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),
                        foregroundColor: MaterialStatePropertyAll(Colors.white)
                    ),
                  ),
                )
              ]),
              Text(_counter.toString(),
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20
                  )
              )
            ]
          ),
        ),
        Container(
          height: 600,
          width: 200,
          color:Colors.green,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [

              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.lightGreen),
                  backgroundColor: MaterialStatePropertyAll(Colors.white)
                ),
                onPressed:gotopage ,
                child: Text("See Results",style:TextStyle(
                  fontStyle: FontStyle.italic,fontSize: 28
                )),
              )

            ],
          ),
        )
      ]
      )
    );
  }
}