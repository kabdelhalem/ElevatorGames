import 'package:flutter/material.dart';
import 'package:elevatorgames/shared/globals.dart' as globals;

class User extends StatefulWidget {
  
  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${globals.userName}'),
        backgroundColor: Colors.grey,
      ),
      body: Column(children: [
        SizedBox(height: 40,),
        Text(
          'Stats',
          style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
        ),
        
        SizedBox(height: 20,),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Column(
            children: [
              Text(
                '1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                'Games Won',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          
          SizedBox(width: 25,),
          
          Column(
            children: [
              Text(
                '0',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                'Win %',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          )
        ],),
        
        SizedBox(height: 40,),
        
        
        Text(
          'Leaderboard',
          style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
        ),
        SizedBox(height: 20,),
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                child: Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 25,
                    ),
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Row(
                        children: [
                          Text('User ${index}'),
                          SizedBox(width: 30,),
                          Text('1111 points')
                        ],
                      ),
                    )
                  ),
                ),
              );
            },
          )
        ),
        Text('LeaderBoard'),
        Row(children: [
          Text("Wordle Points: "),
          Text('100 points')
        ],)
      ],)
    );
  }
}