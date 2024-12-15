import 'package:flutter/widgets.dart';
import 'package:lab2/widgets/joke_card.dart';

import '../models/joke.dart';

class JokesGrid extends StatefulWidget {
  final List<Joke> jokes;
  const JokesGrid({super.key, required this.jokes});

  @override
  State<JokesGrid> createState() => _PokemonGridState();
}

class _PokemonGridState extends State<JokesGrid> {

  @override
  Widget build(BuildContext context) {
    return GridView.count(padding: const EdgeInsets.all(4),
        crossAxisCount: 1,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        semanticChildCount: 250,
        childAspectRatio: 100 / 25,
        shrinkWrap: true,
        children: widget.jokes.map((joke) => JokeCard(
          setup: joke.setup,
          punchline: joke.punchline,
        )).toList()
    );
  }
}
