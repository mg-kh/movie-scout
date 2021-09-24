import 'package:flutter/material.dart';

void main(){
  runApp(MovieScout());
}

class MovieScout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.blueGrey[900],
        ),
      ),
    );
  }
}
