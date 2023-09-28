import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import '../models/quiz_question.dart';
import '../models/quiz_reponse.dart';
var questionSetProvider = ChangeNotifierProvider((ref) => QuestionSet(),);

class QuestionSet with ChangeNotifier{

  String jsonList = '''[
    {
      "category": "Geography",
      "type": "multiple",
      "difficulty": "hard",
      "question": "Which of these island countries is located in the Caribbean?",
      "correct_answer": "Barbados",
      "incorrect_answers": ["Fiji", "Maldives", "Seychelles"]
    },
    {
      "category": "Science & Nature",
      "type": "multiple",
      "difficulty": "medium",
      "question": "What mineral has the lowest number on the Mohs scale?",
      "correct_answer": "Talc",
      "incorrect_answers": ["Quartz", "Diamond", "Gypsum"]
    }
  ]''';
  List<QuizQuestion>? quizQuestions = [];
  var score=0;

   getList() async {
    final response = await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
    if(response.statusCode==200){
    QuizResponse data = await QuizResponse.fromJson(jsonDecode(response.body));
    print(data.results);
    quizQuestions = data.results;
    notifyListeners();
    }
  }

}

