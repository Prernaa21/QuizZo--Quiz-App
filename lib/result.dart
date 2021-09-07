import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    vertical: 70
                ),
                child: SizedBox(
                  width: 200.0,
                  height: 50.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Text(
                      'RESULT',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 40.0,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    bottom: 30
                ),
                child: Text(
                  '$score/10',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

              ),
              Center(
                child:  Image(
                  image: AssetImage("android/app/src/main/res/drawable/right.gif"),
                  height: 200,
                  width: 300,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: 50
                ),
                child: ElevatedButton(
                    child: Text("RESTART"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                    onPressed: (){
                      Navigator.push
                        (context, MaterialPageRoute(builder: (context)
                      => QuizScreen()));}
                ),
              ),
              Container(

                child: ElevatedButton(
                    child: Text("EXIT"),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        padding: MaterialStateProperty.all(EdgeInsets.all(10)),
                        textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
                    onPressed: (){
                      Navigator.pop
                        (context);}
                ),
              )],
          ),
        ),
      ),
    );
  }
}
