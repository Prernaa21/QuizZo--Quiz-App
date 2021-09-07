import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'QuizScreen.dart';

class Result extends StatelessWidget {
  final int score;
  Result({this.score});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 50
                ),
                child: SizedBox(
                  width: 200.0,
                  height: 100.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.greenAccent,
                    child: Text(
                      'RESULT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),

                ),

              ),
              Center(
                child:  Image(
                  image: AssetImage("android/app/src/main/res/drawable/main2.gif"),
                  height: 200,
                  width: 300,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 100
                ),
                child: ElevatedButton(
                    child: Text("REPLAY"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                    onPressed: (){
                      Navigator.push
                        (context, MaterialPageRoute(builder: (context)
                      => QuizScreen()));}
                ),
              )],
          ),
        ),
      ),
    );
  }
}
