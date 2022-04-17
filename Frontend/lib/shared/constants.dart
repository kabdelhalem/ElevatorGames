import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  //fillColor: Colors.white,
  //filled: true,
  hintText: '_',
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.yellow)
  ),
  contentPadding: EdgeInsets.all(10)
);