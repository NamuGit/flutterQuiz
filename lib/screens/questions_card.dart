import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/models/option_set.dart';
import 'package:untitled/provider/api_provider.dart';

import '../provider/option_provider.dart';
import '../provider/page_index.dart';
import 'option_card.dart';

class QuestionsCard extends ConsumerStatefulWidget {
  const QuestionsCard({Key? key}) : super(key: key);

  @override
  ConsumerState<QuestionsCard> createState() => _QuestionsCardState();
}

class _QuestionsCardState extends ConsumerState<QuestionsCard> {

  @override
  initState() {
   Future.delayed(Duration.zero,()async {
     await ref.read(questionSetProvider).getList();
   });
  }

  @override
  Widget build(BuildContext context) {
    var questionSet = ref.watch(questionSetProvider).quizQuestions;
    return questionSet?.isNotEmpty==true && questionSet!=null ?Container(
      width: 500,
      height: MediaQuery.of(context).size.height*0.6,
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: PageView.builder(
          itemCount:questionSet.length ,
          itemBuilder: (context, questionIndex){
            ref.read(optionsProvider).getOptions(questionIndex,questionSet);
            if(questionIndex==questionSet.length-1) {
              ref.read(pageIndexProvider).updateIndex(true);
            }
        return Column(
          children: [
            Container(
              height: 120,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              child: Text(questionSet[questionIndex].question,style: TextStyle(color: Colors.white, fontSize: 18),),
            ),
            OptionCard(questionSet,questionIndex),
          ],
        );
      }),
    ):CircularProgressIndicator(color: Colors.white,);

  }
}
