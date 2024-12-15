import 'package:flutter/material.dart';
import 'package:lab2/widgets/joke-type-data.dart';

class JokeTypeCard extends StatelessWidget {
  final String name;

  const JokeTypeCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
          borderRadius: BorderRadius.circular(10),
          splashColor: Colors.red[50],
          onTap: () => {
                Navigator.pushNamed(
                  context,
                  '/jokes_list',
                  arguments: name,
                )
              },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.red.withOpacity(0.8), width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: JokeTypeData(name: name),
          )),
    );
  }
}
