import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/screens/result_screen.dart';

import '../provider/page_index.dart';
class SubmitButton extends ConsumerStatefulWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  ConsumerState<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends ConsumerState<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    var lastIndex = ref.watch(pageIndexProvider).lastIndex;
    return ElevatedButton(onPressed: (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ResultScreen()),
      );
    }, child: Text(lastIndex != null && lastIndex  ?"Submit":"Submit"));
  }
}
