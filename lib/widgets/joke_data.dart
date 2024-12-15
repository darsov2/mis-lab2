import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab2/widgets/joke-type-card.dart';

class JokeData extends StatelessWidget {
  final String setup;
  final String punchline;

  const JokeData({super.key, required this.setup, required this.punchline});

  @override
  Widget build(BuildContext context) {

    return Column(mainAxisSize: MainAxisSize.min,
      children: [
        Text(setup, style: const TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600
        ),),
        Text(punchline, style: const TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600
        ),)
      ],
    );
  }
}
