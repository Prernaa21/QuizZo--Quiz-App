import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Helper.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/result.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

   String api = "https://opentdb.com/api.php?amount=10&category=9&type=multiple";

  Helper helper;

  int currentQues=0;
  int totalSec = 30;
  int elapsedSec= 0;
  Timer timer;
  int score =0;

  @override
  void initState() {

    fetchQuiz();

    super.initState();
  }

  fetchQuiz() async {
    var response = await http.get(Uri.parse(api));
    var body = response.body;
    var json = jsonDecode(body);


    setState(() {
      helper = Helper.fromJson(json);
      helper.results[currentQues].incorrectAnswers.add(
        helper.results[currentQues].correctAnswer
      );
      helper.results[currentQues].incorrectAnswers.shuffle();

      initTimer();
    });
  }

  initTimer(){
    timer =Timer.periodic(Duration(seconds: 1), (t) {
      if(t.tick==totalSec){
        print("Time Up!");
        t.cancel();
        changeQues();
      }
      else{
        setState(() {
          elapsedSec = t.tick;
        });
      }
    }
    );
  }

  @override
    void dispose(){
    timer.cancel();
    super.dispose();
  }

  checkAns(answer){
    String correctAns = helper.results[currentQues].correctAnswer;
    if(correctAns==answer){
      score+=1;
      print("Correct");
    }
    else {
      print("Wrong");
    }
    changeQues();
  }

  changeQues(){
    timer.cancel();

    if(currentQues==helper.results.length-1){
      print("Quiz completed");
      print("Score: $score");

      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => Result(score: score,)));
    }
    else{
      setState(() {
        currentQues+=1;
      });
      helper.results[currentQues].incorrectAnswers.add(
          helper.results[currentQues].correctAnswer
      );
      helper.results[currentQues].incorrectAnswers.shuffle();
      initTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    if(helper != null) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 60
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image(image: AssetImage(
                          "android/app/src/main/res/drawable/what.gif"
                      ),
                        height: 100,
                        width: 100,),
                      Text(
                        "$elapsedSec S",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Q. ${helper.results[currentQues].question}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 40

                  ),
                  child: Column(
                    children: helper.results[currentQues].incorrectAnswers
                        .map((option) {
                      return Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        margin: EdgeInsets.symmetric(
                            vertical: 10
                        ),
                        child: RaisedButton(
                          onPressed: () {
                            checkAns(option);
                          },
                          color: Colors.grey,
                          colorBrightness: Brightness.dark,
                          padding: EdgeInsets.symmetric(
                              vertical: 20
                          ),
                          child: Text(option,
                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    else {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
