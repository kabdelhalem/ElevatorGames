import 'package:elevatorgames/pages/wordleGame/wordle.dart';
import 'package:flutter/material.dart';
import 'package:elevatorgames/pages/wordleGame/wordlemain.dart';
import 'package:elevatorgames/services/chooseDifficulty.dart';

class WordleMain extends StatefulWidget {
  const WordleMain({ Key? key }) : super(key: key);

  @override
  State<WordleMain> createState() => _WordleMainState();
}

class _WordleMainState extends State<WordleMain> {
  String dropdownValue = 'Three Letters';
  String newDropDownValue = '';
   var items = [    
    'Three Letters',
    'Four Letters',
    'Five Letters',
  ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Wordle')
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: Column(children: [
            Text(
              'Wordle',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            
            SizedBox(height: 20,),
            
            Text('Choose Difficulty'),
            
            DropdownButton<String>(
              value: dropdownValue,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: items.map((String items){
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
            ),
            
            SizedBox(height: 15,),
            
            ElevatedButton(onPressed: (){
              print(chooseDifficulty(dropdownValue));
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Wordle(newDropDownValue : dropdownValue),
              ));
            },
            child: Text(
              'Play',
              style: TextStyle()
            )
            ),
            
            
            
            
          ],),
        ),
      )
    );
  }
}