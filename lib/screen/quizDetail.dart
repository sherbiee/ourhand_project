import 'package:flutter/material.dart';
import 'package:ourhand_project/main.dart';
import 'quiz.dart';

class QuizDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizDetailState();
  }
}

class _QuizDetailState extends State<QuizDetail> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Palette.colour.shade50,
        body: Container(
          margin: const EdgeInsets.all(20.0),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(10.0)),

              Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Question ${quesNo + 1} of ${quiz.questions.length}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Score: $finalScore",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),

              //image
              Padding(padding: EdgeInsets.all(30.0)),
              Image.network("${quiz.images[quesNo]}"),

              Padding(padding: EdgeInsets.all(20.0)),

              //ques
              Text(
                quiz.questions[quesNo],
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Padding(padding: EdgeInsets.all(20.0)),

              //row1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //button 1
                  MaterialButton(
                    minWidth: 120.0,
                    color: Palette.colour.shade500,
                    onPressed: () {
                      if (quiz.choices[quesNo][0] == quiz.correctAns[quesNo]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: Text(
                      quiz.choices[quesNo][0],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Palette.colour.shade900,
                      ),
                    ),
                  ),
                  //button 2
                  MaterialButton(
                    minWidth: 120.0,
                    color: Palette.colour.shade500,
                    onPressed: () {
                      if (quiz.choices[quesNo][1] == quiz.correctAns[quesNo]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: Text(
                      quiz.choices[quesNo][1],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Palette.colour.shade900,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.all(10.0)),

              //row2
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //button 3
                  MaterialButton(
                    minWidth: 120.0,
                    color: Palette.colour.shade500,
                    onPressed: () {
                      if (quiz.choices[quesNo][2] == quiz.correctAns[quesNo]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: Text(
                      quiz.choices[quesNo][2],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Palette.colour.shade900,
                      ),
                    ),
                  ),
                  //button 4
                  MaterialButton(
                    minWidth: 120.0,
                    color: Palette.colour.shade500,
                    onPressed: () {
                      if (quiz.choices[quesNo][3] == quiz.correctAns[quesNo]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: Text(
                      quiz.choices[quesNo][3],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Palette.colour.shade900,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.all(60.0)),

              Container(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  color: Palette.colour.shade800,
                  minWidth: 240.0,
                  height: 40.0,
                  onPressed: resetQuiz,
                  child: Text(
                    "Quit",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Palette.colour.shade900,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      quesNo = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (quesNo == quiz.questions.length - 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Summary(score: finalScore)));
      } else {
        quesNo++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;
  const Summary({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Palette.colour.shade50,
        body: Container(
          child: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Final Score: $score",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              MaterialButton(
                color: Palette.colour,
                onPressed: () {
                  quesNo = 0;
                  finalScore = 0;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Quiz();
                      },
                    ),
                  );
                },
                child: Text(
                  "Reset Quiz",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Palette.colour.shade900,
                  ),
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}

class SignQuiz {
  var images = [
    "https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/hello.png?alt=media&token=9fa5b368-ce47-4887-a4dd-11736a86d587",
    "https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/goodbye.jpg?alt=media&token=cf0c796e-e616-4e4e-97f5-f33b22d828d6",
    "https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/thankyou.jpg?alt=media&token=3c1e680d-8379-4c81-bc61-fcb8918764b3",
    "https://firebasestorage.googleapis.com/v0/b/ourhand-4ace1.appspot.com/o/please.jpg?alt=media&token=c0cf7582-769c-4199-84ca-201186a8f183",
  ];

  var questions = [
    "What is the meaning of this sign ?",
    "What is the meaning of this sign ?",
    "What is the meaning of this sign ?",
    "What is the meaning of this sign ?",
  ];

  var choices = [
    ["Hello", "No", "Thank you", "Sorry"],
    ["You are welcome", "Good bye", "Please", "Sorry"],
    ["Sorry", "I love you", "Thank you", "Yes"],
    ["Hello", "Thank you", "I love you", "Please"],
  ];

  var correctAns = ["Hello", "Good bye", "Thank you", "Please"];
}

var finalScore = 0;
var quesNo = 0;
var quiz = SignQuiz();
