//import 'package:elevatorgames/pages/wordleGame/services/WordleGame2.dart';
import 'package:elevatorgames/pages/wordleGame/services/wordleGame.dart';
import 'package:elevatorgames/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:elevatorgames/services/chooseDifficulty.dart';
import 'package:elevatorgames/services/calculateWordle.dart';

class Wordle extends StatefulWidget {
  
  String newDropDownValue;
  Wordle({required this.newDropDownValue});

  @override
  State<Wordle> createState() => _WordleState();
}

class _WordleState extends State<Wordle> {
  
  int dropDownValue = 3; //chooseDifficulty(newDropDownValue);
  
  int tries = 6;

  List<String> userGuess = [];
  
  checkGuess(tries, word, userguess){
    List<int> guess = [];
    List<String> checkWord = [];
    
    for(int i = 0; i<word.length; i++){
      checkWord.add(word[i]);
    }
    
    print(checkWord);
    
    for(int i = 0; i<3 /*widget.newDropDownValue*/; i++){
      guess.add(0);
      
      if(word.contains(userguess[i])){
        guess[i] = 1;
      }
      
      if(checkWord[i] == userguess[i]){
        guess[i] = 2;
      }
    }
    return guess;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wordle')
      ),
      body: Column(
        children: [
          Text("Wordle"),
          Text('Dropdown Value: ${chooseDifficulty(widget.newDropDownValue)}'),
          Padding(
            padding: const EdgeInsets.fromLTRB(250, 10, 250, 0),
            child: Column(
              children: List<Widget>.generate(6, (index){
                return Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: List<Widget>.generate(chooseDifficulty(widget.newDropDownValue), (index){
                              return Container(
                                child: new Flexible(
                                  child: TextFormField(
                                    decoration: textInputDecoration,
                                    maxLength: 1,
                                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                                    validator: (val){
                                      return val!.length < 1 ? '' : null;
                                    },
                                    onChanged: (val){
                                      setState(() {
                                        userGuess.add(val);
                                      });
                                    }
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          ElevatedButton(
                  onPressed: (){
                    print(userGuess);
                    //print(WordleGame2(widget.newDropDownValue, myList.join(), tries));
                    //print(userGuess.join());
                    print(checkGuess(tries, 'pie', userGuess));
                    tries -= 1;
                    userGuess = [];
                  },
                  child: Text(
                    'Enter',
                    style: TextStyle(
                    ),
                  )
                )
        ],
      ),
      
    );
  }
}