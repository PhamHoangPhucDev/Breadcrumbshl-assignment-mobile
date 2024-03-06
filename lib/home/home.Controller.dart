import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/jokes.Model.dart';

class HomeController {
  List<JokesModel> listJokes = [];
  int index = 0;

  Future<List<JokesModel>> loadDataJokes() async {
    var data = await rootBundle.loadString("assets/data/jokes_json.json");
      List<JokesModel> item = JokesModel.fromJsonList(json.decode(data));
    return item;
  }

  Future saveJokesWatched(int id,String vote) async {
    try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? items = prefs.getString('$id');
      if(items!=null&&items.isNotEmpty){
        
      } else {
        await prefs.setString('$id', vote);
      }
    } catch (e) {
      SharedPreferences.setMockInitialValues({});
    }
//         final SharedPreferences prefs = await SharedPreferences.getInstance();

// await prefs.remove('0');
// await prefs.remove('1');
// await prefs.remove('2');
// await prefs.remove('3');
  }

  clearJokesWatched() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<JokesModel> tmp = [];
    tmp.addAll(listJokes);
    for (int i = 0 ; i < listJokes.length; i++) {
      final String? items = prefs.getString('$i');
      if(items!=null&&items.isNotEmpty){
        tmp.removeWhere((element) => element.id == i);
      }
    }
    listJokes = tmp;
  }
}