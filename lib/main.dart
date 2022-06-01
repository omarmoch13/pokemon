import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/home.dart';

void main() {
  runApp(ditto());
}

class ditto extends StatelessWidget {
  const ditto({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: home(),
      
      
    );
  }
}