import 'package:flutter/material.dart';
import 'package:elevatorgames/pages/home.dart';


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
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Home(userName : userName),
              ));
          },
          child: Text('Elevator Games')
        )
        
        
      ]),
    );
  }
}