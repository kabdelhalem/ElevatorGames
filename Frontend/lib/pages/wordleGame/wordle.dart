import 'package:elevatorgames/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Wordle extends StatefulWidget {
  
  String newDropDownValue;
  Wordle({required this.newDropDownValue});

  @override
  State<Wordle> createState() => _WordleState();
}

class _WordleState extends State<Wordle> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wordle')
      ),
      body: Column(
        children: [
          Text("Wordle"),
          Text('Dropdown Value: ${widget.newDropDownValue}'),
          Padding(
            padding: const EdgeInsets.fromLTRB(250, 10, 250, 0),
            child: Row(
              children: [
                new Flexible(
                  child: TextFormField(
                    decoration: textInputDecoration,
                    maxLength: 1,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    validator: (val){
                      return val!.length < 1 ? '' : null;
                    },
                    onChanged: (val){
                      setState(() {
                        //print(val);
                      });
                    }
                  ),
                ),
                SizedBox(width:5, height: 5,),
                new Flexible(
                  child: TextFormField(
                    decoration: textInputDecoration,
                    maxLength: 1,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    validator: (val){
                      return val!.length < 1 ? '' : null;
                    },
                    onChanged: (val){
                      setState(() {
                        //print(val);
                      });
                    }
                  ),
                ),
                SizedBox(width:5, height: 5,),
                new Flexible(
                  child: TextFormField(
                    decoration: textInputDecoration,
                    maxLength: 1,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    validator: (val){
                      return val!.length < 1 ? '' : null;
                    },
                    onChanged: (val){
                      setState(() {
                        //print(val);
                      });
                    }
                  ),
                ),
                SizedBox(width:5, height: 5,),
                new Flexible(
                  child: TextFormField(
                    decoration: textInputDecoration,
                    maxLength: 1,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    validator: (val){
                      return val!.length < 1 ? '' : null;
                    },
                    onChanged: (val){
                      setState(() {
                        //print(val);
                      });
                    }
                  ),
                ),
                SizedBox(width:5, height: 5,),
                new Flexible(
                  child: TextFormField(
                    decoration: textInputDecoration,
                    maxLength: 1,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    validator: (val){
                      return val!.length < 1 ? '' : null;
                    },
                    onChanged: (val){
                      setState(() {
                        //print(val);
                      });
                    }
                  ),
                ),
                TextButton(
                  onPressed: (){
                    
                  },
                  child: Text(
                    'Enter',
                    style: TextStyle(
                      backgroundColor: Colors.amber
                    ),
                  )
                )
              ],
            ),
          )
        ],
      ),
      
    );
  }
}