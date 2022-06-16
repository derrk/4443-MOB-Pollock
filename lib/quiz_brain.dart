import 'question.dart';
import 'dart:async';
import 'dart:convert' as chg;
import 'package:http/http.dart' as http;
// Ratings and popularity was low for http_requests - opted for http instead
//import 'package:http_requests/http_requests.dart';

// declare string var so i don't have retype
const String hostName = "localhost:8080";

// class QuizBrain that will handle all of the functionality of the app
// connects to the api writing w/ fastApi hosting to local host until I
// figure out hosting to a droplet
class QuizBrain {
  QuizBrain() {
    reset();
  }

  // increment the question id
  // so it points to the next question
  Future<void> nextQuestion() async {
    Uri url = Uri.http(hostName, "/next");
    await http.get(url);
  }

  // pull question from the api and
  // json file. return as String
  Future<String> getQuestionText() async {
    Uri url = Uri.http(hostName, "/question");
    var r = await http.get(url);
    // decode json component return as string
    if (r.statusCode == 200) {
      var jsonResponse = chg.jsonDecode(r.body) as Map<String, dynamic>;
      String question = jsonResponse['question'];
      return question;
    }
    return " ";
  }

  Future<bool> getCorrectAnswer() async {
    Uri url = Uri.http(hostName, "/answer");

    var r = await http.get(url);
    if (r.statusCode == 200) {
      var jsonResponse = chg.jsonDecode(r.body) as Map<String, dynamic>;
      bool answer = jsonResponse['answer'];
      return answer;
    }
    return false;
  }

  Future<bool> isFinished() async {
    Uri url = Uri.http(hostName, "/finished");

    var r = await http.get(url);
    if (r.statusCode == 200) {
      var jsonResponse = chg.jsonDecode(r.body) as Map<String, dynamic>;
      bool isFinished = jsonResponse['isFinished'];
      return isFinished;
    }
    return true;
  }

  Future<void> reset() async {
    Uri url = Uri.http(hostName, "/reset");
    await http.get(url);
  }
}
//  Old code for functions within Quizbrain to pull
//  data that has been hardcoded.
//
//   void nextQuestion() {
//     if (_questionNum < _questions.length - 1) {
//       _questionNum++;
//     }
//     print(_questionNum);
//     print(_questions.length);
//   }
//
//   // String getQuestionText() {
//   //   return _questions[_questionNum].questionText;
//   // }
//
//   bool getQuestionAns() {
//     return _questions[_questionNum].questionAns;
//   }
//
//   bool isFinished() {
//     if (_questionNum >= _questions.length - 1) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   void reset() {
//     _questionNum = 0;
//   }
// }
// //
// // bool getCorrectAns() {
// //   return _questions[_questionNum].question
// // }
