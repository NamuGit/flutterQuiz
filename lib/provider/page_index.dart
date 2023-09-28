import 'package:flutter/material.dart';
import 'package:untitled/provider/api_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var pageIndexProvider = ChangeNotifierProvider((ref) => PageIndex());

class PageIndex with ChangeNotifier{
  var lastIndex;

  updateIndex(value){
    lastIndex = value;
    notifyListeners();
  }
  getIndex(){
    return lastIndex;
  }
}