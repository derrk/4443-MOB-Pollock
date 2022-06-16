import 'dart:async';
import 'dart:convert';
//import 'package:http/http.dart';
import 'package:http_requests/http_requests.dart';

class Question {
  String text;
  bool answer;

  Question({this.text = "", this.answer = false});

  bool getAnswer() {
    return answer;
  }

  // if you pass a json object as a question
  // it will pull out all the json attributes
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(text: json['text'], answer: json['answer']);
  }

  Future<String> getQuestionText() async {
    Response r = await HttpRequests.get("http://localhost:8080/question");
    print(r.success);
    print(r.json);
    print(r.json['question']);
    if (r.success) {
      return r.json['question'];
    } else {
      throw Exception('Failed to get question');
    }
  }
}

//
// void main() async {
//   String q = await getQuestionText();
//   print(q);
// }

// void nextQuestion async () {
//   if (_questionNum < _questions.length - 1) {
//     _questionNum++;
//   }
//   print(_questionNum);
//   print(_questions.length);
// }
