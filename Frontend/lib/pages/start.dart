import 'package:flutter/material.dart';
import 'package:elevatorgames/pages/home.dart';
import 'package:elevatorgames/shared/globals.dart' as globals;


class Start extends StatelessWidget {

  String userName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 300),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter a Username'
            ),
            validator: (val){
              return val!.length > 0 ? 'Please enter a Username' : null;
            },
            onChanged: (val){
              userName = val;
            },
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: (){
            globals.userName = userName;
            Navigator.pushReplacementNamed(context, '/');
          },
          child: Text('Elevator Games')
        )
        
        
      ]),
    );
  }
}