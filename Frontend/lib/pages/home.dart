import 'package:elevatorgames/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:elevatorgames/pages/start.dart';

class Home extends StatefulWidget {
  const Home({ Key? key,  required this.userName}) : super(key: key);
  
  final String userName;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Elevator Games"),
        backgroundColor: Colors.grey,
        actions: [
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text(''),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => User(userName : widget.userName),
              ));
            },
          )
        ],
      ),
      body: Column(children: [
        TextButton(
          onPressed: (){
            Navigator.pushNamed(context, '/wordlemain');
          },
          child: Text('Wordle')
        )
      ],)
    );
  }
}