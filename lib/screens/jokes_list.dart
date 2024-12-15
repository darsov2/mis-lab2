import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab2/models/joke.dart';
import 'package:lab2/services/jokes_service.dart';
import 'package:lab2/widgets/jokes_grid.dart';

class JokesList extends StatefulWidget {
  final String type;

  const JokesList({super.key, required this.type});

  @override
  State<JokesList> createState() => _JokesListState();
}

class _JokesListState extends State<JokesList> {
  List<Joke> jokes = [];

  @override
  void initState() {
    super.initState();
    fetchJokes();
  }

  void fetchJokes() async {
    print(widget);
    // final data = json.decode(response[0]);

    // print(data);
    final List<dynamic> response = await ApiService.getTenJokes(widget.type);

    // Debug the response
    print(response);

    // Directly map the List<dynamic> to List<Joke>
    final List<Joke> fetchedJokes =
        response.map((joke) => Joke.fromJson(joke)).toList();

    setState(() {
      jokes = fetchedJokes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.white, size: 24),
        ),
        title: const Text(
          "Jokes App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              final response = await ApiService.getRandomJoke();
              final randomJoke = Joke.fromJson(response);

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Random Joke"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(randomJoke.setup),
                        SizedBox(height: 10),
                        Text(randomJoke.punchline),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the dialog
                        },
                        child: Text("Close"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.settings, color: Colors.white, size: 24),
          ),
        ],
      ),
      body: JokesGrid(
        jokes: jokes,
      ),
    );
  }
}
