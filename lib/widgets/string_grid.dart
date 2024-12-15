import 'package:flutter/widgets.dart';
import 'package:lab2/widgets/joke-type-card.dart';

class StringGrid extends StatefulWidget {
  final List<String> entites;

  const StringGrid({super.key, required this.entites});

  @override
  State<StringGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<StringGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        padding: const EdgeInsets.all(4),
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        semanticChildCount: 250,
        childAspectRatio: 100/30,
        shrinkWrap: true,
        children: widget.entites
            .map((entity) => JokeTypeCard(name: entity))
            .toList());
  }
}
