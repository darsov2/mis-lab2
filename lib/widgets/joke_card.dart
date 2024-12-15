import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2/widgets/joke-type-data.dart';

import 'joke_data.dart';

class JokeCard extends StatelessWidget {
  final String setup;
  final String punchline;

  const JokeCard({super.key, required this.setup, required this.punchline});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      color: Colors.white,
      child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.red[50],
          child: Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border:
                Border.all(color: Colors.red.withOpacity(0.8), width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: JokeData(setup: setup, punchline: punchline,),
          )),
    );
  }
}
