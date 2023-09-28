import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/api_provider.dart';
import '../provider/option_provider.dart';
class ResultScreen extends ConsumerStatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends ConsumerState<ResultScreen> {

  @override
  Widget build(BuildContext context) {
    var score = ref.read(optionsProvider).calculatedScore();
    var questionSet = ref.watch(questionSetProvider).quizQuestions;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color:  Color(0xff36454F),
          padding: const EdgeInsets.all(10.0) ,
          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.7,
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(50.0) ,
            decoration: BoxDecoration(
                color:Color(0xffB2BEB5),
                borderRadius: BorderRadius.circular(10.0)
            ),
            child: Column(
              children: [
                Text("Congratulations' 🎉'" , style: TextStyle(fontSize: 22),),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("You Score: $score", style: TextStyle(fontSize: 28)),
                ),
                Image.asset("assets/images/celebrate.png", height: 200, width: 300,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Total Question in the set: ${questionSet?.length}", style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Best Luck !!", style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
