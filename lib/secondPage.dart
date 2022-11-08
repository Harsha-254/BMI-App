import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class secondPage extends StatefulWidget {
  secondPage({required this.BMI});
  var BMI;

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    var bmi=widget.BMI.toString();
    decision(){
      if(widget.BMI<18.5){
        return "Underweight";
      }else if(widget.BMI>=18.5 && widget.BMI<=25){
        return "Normal weight";
      }else if(widget.BMI>25 && widget.BMI<30){
        return "Overweight";
      }else if(widget.BMI>30){
        return "Obese";
      }
    }
    backpls(){
      Navigator.pop(context);
    }
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text("RESULTS",style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.red
        )
        ),
      ),
    body:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Text("Your BMI is:",style: TextStyle(
                    fontStyle: FontStyle.italic,fontSize: 28,color: Colors.white
                ),),
                Text(bmi,style: TextStyle(
                  fontSize: 30,fontStyle: FontStyle.italic,color: Colors.white
                ),),
                Text("According to BMI, you are "+decision().toString(),style: TextStyle(
                    fontSize: 30,fontStyle: FontStyle.italic,color: Colors.white
                ),)
                ]),
              Column(children: [
                Text("Please rate us!!!",style: TextStyle(
                    fontStyle: FontStyle.italic,fontSize: 28,color: Colors.white
                ),),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                ElevatedButton(onPressed: backpls,
                  style:ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    foregroundColor: MaterialStatePropertyAll(Colors.blueAccent)
                  ) ,
                  child: Text("Submit and re-calculate",style: TextStyle(
                    fontSize: 26,fontStyle: FontStyle.italic,color: Colors.blueAccent
                ),),
                )
            ])])
      ],
    )
    );
  }
}