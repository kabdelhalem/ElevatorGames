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

  List<String> myList = [];
  
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
                                        myList.add(val);
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
                    print(myList);
                    calculateWordle(myList);
                    
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