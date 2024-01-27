import 'package:flutter/material.dart';

import 'pageone.dart';
class resultScreen extends StatelessWidget {
  final totalScore;
  final correctAns;

  const resultScreen({super.key, required this.totalScore, required this.correctAns});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Quiz Hub"),
      ),
      body: Container(
      decoration:const BoxDecoration(
      image: DecorationImage(
      image: AssetImage("assets/images/bg.png"),fit: BoxFit.cover),
      ),
    child : Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.yellow,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20.0, // soften the shadow
                      spreadRadius: 2.0, //extend the shadow
                      offset: Offset(
                        0.0, // Move to right 5  horizontally
                        0.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                ),
                height: 250,
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text('Total Score : $totalScore'),
                  Text('Correct Answers : $correctAns'),
                  Text('Wrong Answers : ${5-correctAns}'),],
              ),)
              ,
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
              }, child: Text("Restart"))
            ],
          ),
        ),
      ),),
    );
  }
}
