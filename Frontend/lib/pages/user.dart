import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({ Key? key }) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UserName'),
        backgroundColor: Colors.grey,
      ),
      body: Column(children: [
        Text('LeaderBoard'),
        Row(children: [
          Text("Wordle Points: "),
          Text('100 points')
        ],)
      ],)
    );
  }
}