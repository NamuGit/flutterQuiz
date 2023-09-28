import 'package:flutter/material.dart';
import 'package:untitled/provider/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/option_set.dart';

var optionsProvider = ChangeNotifierProvider((ref) => Answers());

class Answers with ChangeNotifier{

  List<OptionSet> optionList=[] ;
  var score = Map();
  // var lastIndex= false;


  getOptions(index,quizQuestions){
    optionList=[];
    List<OptionSet> list=[] ;
    quizQuestions[index].incorrectAnswers.forEach((element) {
      list.add(OptionSet(color: "0xffB2BEB5", name: element));
    });
    list.add(OptionSet(color: "0xffB2BEB5", name: quizQuestions[index].correctAnswer));
    optionList.addAll(list);
    notifyListeners();
    return optionList;
  }

  validateAnswers(selectAnswer, questionIndex,quizQuestions){
    if(quizQuestions[questionIndex].correctAnswer == optionList[selectAnswer].name){
      optionList[selectAnswer].color ="0xff50C878"  ;
      score[questionIndex] = 1;
      notifyListeners();
      return true;
    }else{
      optionList[selectAnswer].color ="0xffFF5733 "  ;
      score[questionIndex] = 0;
      notifyListeners();
      return false;
    }

  }

  calculatedScore(){
    num totalScore=0 ;
    score.forEach((key, value) {
      totalScore = totalScore + value;
    });
    return totalScore;
  }
}

