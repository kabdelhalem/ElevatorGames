import 'package:flutter/material.dart';
import 'package:elevatorgames/pages/home.dart';
import 'package:elevatorgames/pages/user.dart';
import 'package:elevatorgames/pages/wordleGame/wordle.dart';
import 'package:elevatorgames/pages/wordleGame/wordlemain.dart';
import 'package:elevatorgames/pages/start.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/start',
    routes: {
      //'/':(context) => Home(),
      //'/user':(context) => User(),
      // '/wordle':(context) => Wordle(),
      '/wordlemain':(context) => WordleMain(),
      '/start':(context) => Start(),
      
    }
  ));
}

