import 'package:flutter/material.dart';
import '../main.dart';

import 'quizDetail.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Part"),
        backgroundColor: Palette.colour.shade50,
      ),
      backgroundColor: Palette.colour.shade50,
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              height: 60.0,
              color: Palette.colour,
              onPressed: startQuiz,
              child: Text(
                "Let Start",
                style: TextStyle(fontSize: 25.0, color: Colors.white ,fontWeight: FontWeight.w500,),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startQuiz() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => QuizDetail() ));
    });
  }
}
