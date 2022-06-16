import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'question.dart';
import 'dart:async';
import 'dart:convert';
//import 'package:http/http.dart';
//import 'package:http_requests/http_requests.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade400,
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  //const QuizPage({Key? key}) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // create list to keep score of correct/wrong answers
  List<Icon> scoreKeeper = [];

  String currentQ = "";

  void setCurrentQ() async {
    String qtext = await quizBrain.getQuestionText();

    setState(() {
      currentQ = qtext;
    });
  }

  void checkAnswer(bool userAns) async {
    bool correctAns = await quizBrain.getCorrectAnswer();
    bool isFinished = await quizBrain.isFinished();

    // update the state to match the api results
    setState(() {
      if (isFinished) {
        if (userAns == correctAns) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }

        Alert(
          style: AlertStyle(
            isCloseButton: false,
            isOverlayTapDismiss: false,
          ),
          //TODO: add alert image
          context: context,
          title: 'Finished',
          desc: 'Close to go to the next quiz',
          buttons: [
            DialogButton(
              onPressed: () {
                Navigator.pop(context);
                quizBrain.reset();
                // empty scorekeeper for next quiz
                scoreKeeper = [];
              },
              width: 120.0,
              child: const Text(
                "Close",
                style: TextStyle(color: Colors.red, fontSize: 25.0),
              ),
            )
          ],
        ).show();
      } else {
        if (userAns == correctAns) {
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.red,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  //
  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }
  @override
  Widget build(BuildContext context) {
    // init current question text pull
    setCurrentQ();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                currentQ,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          // True button
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                // quizBrain.getQuestionText();
                print('user picked true');
                checkAnswer(true);
              }, // ^ The user picked true. ^
            ),
          ),
        ),
        // False Button
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

//************************************************************************
// Alternative way to display api info onto screen, much more complicated
// found a better way, but left in old code for future reference.
//************************************************************************
// child: FutureBuilder(
//   future: getQuestionText(),
//   builder: (context, snapshot) {
//     switch (snapshot.connectionState) {
//       case ConnectionState.none:
//         return Text('none');
//       case ConnectionState.active:
//         return Text('active');
//       case ConnectionState.waiting:
//         return Text('waiting');
//       case ConnectionState.done:
//         return Text(
//           snapshot.data,
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 25.0, color: Colors.white),
//         );
//       default:
//         return Text('default');

//*******************************************************************
// Code before API implementation RIP.
//*******************************************************************
//
//       children: <Widget>[
//         // flex: 5,
//         // child: Padding(
//         //   padding: EdgeInsets.all(10.0),
//         //   child: Center(
//         //     child: FutureBuilder<String>(
//         //       future: getQuestionText(),
//         //       builder:
//         //           (BuildContext context, AsyncSnapshot<String> questiontxt) {
//         //         child:
//         //         return Text(
//         //           getQuestion() as Future<String>,
//         //           style: TextStyle(color: Colors.white, fontSize: 25.0),
//         //         );
//         //       },
//         //     ),
//         //     // child: Text(
//         //     //   // finally figured out the error, casted as string instead
//         //     //   // of future<String>... maybe it works maybe not.
//         //     //   getQuestionText(), //quizBrain.getQuestionText(),
//         //     //   textAlign: TextAlign.center,
//         //     //   style: TextStyle(
//         //     //     fontSize: 25.0,
//         //     //     color: Colors.white,
//         //     //   ),
//         //     // ),
//         //   ),
//         // ),
//
