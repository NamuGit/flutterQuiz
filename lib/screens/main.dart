import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/models/quiz_question.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/screens/questions_card.dart';
import 'package:untitled/screens/result_screen.dart';
import 'package:untitled/screens/submit_button.dart';

import '../provider/page_index.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {

  @override
  Widget build(BuildContext context) {
    var lastIndex = ref.read(pageIndexProvider).getIndex();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.quiz), title: Text("Quiz App"), ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color: Color(0xff36454F),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QuestionsCard(),
              SubmitButton()

            ],
          ),
        ),
      ),
    );
  }

  void evaluateSelection() {}
}

