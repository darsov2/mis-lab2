import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab2/widgets/joke-type-card.dart';

class JokeTypeData extends StatelessWidget {
  final String name;

  const JokeTypeData({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
            child: Text(
          name,
          style: const TextStyle(
              color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600),
        ))
      ],
    );
  }
}
