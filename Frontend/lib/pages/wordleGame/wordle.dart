import 'package:flutter/material.dart';

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
        ],
      ),
      
    );
  }
}