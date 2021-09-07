import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'QuizScreen.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark
      )
    );
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
                  height: 100.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey,
                    child: Text(
                      'QuizZo',
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
                  child: Text("PLAY NOW!"),
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
