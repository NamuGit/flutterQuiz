import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/option_provider.dart';
import '../models/option_set.dart';

class OptionCard extends ConsumerStatefulWidget {
  var questionIndex;
  var questionSet;
   OptionCard(this.questionSet, this.questionIndex,{Key? key} ) : super(key: key);

  @override
  ConsumerState<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends ConsumerState<OptionCard> {
  @override
  Widget build(BuildContext context) {
    List<OptionSet> optionList = ref.read(optionsProvider).optionList;
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      height: MediaQuery.of(context).size.height*0.3,
      alignment: Alignment.center,
      padding: EdgeInsets.all(2.0),
      child: ListView.builder(
          itemCount: optionList.length,
          itemBuilder: (context , optionIndex){
            return GestureDetector(
              onTap: () {
                if(!ref.watch(optionsProvider).score.containsKey(widget.questionIndex)) {
                  ref.watch(optionsProvider).validateAnswers(optionIndex, widget.questionIndex,widget.questionSet);
                }
              },
              child: Container(
                width: 200,
                height: 50,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(15.0) ,
                decoration: BoxDecoration(
                    color: Color(int.parse(optionList[optionIndex].color)),
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Text(optionList[optionIndex].name,
                  style: TextStyle(color: Colors.white),),
              ),
            );
          }),
    );
  }
}
