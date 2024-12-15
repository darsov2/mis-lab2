import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lab2/services/jokes_service.dart';
import 'package:lab2/widgets/string_grid.dart';

import '../models/joke.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> types = [];

  @override
  void initState() {
    super.initState();
    fetchJokeTypes();
  }

  void fetchJokeTypes() async {
    final response = await ApiService.fetchJokeTypes();
    final List<String> data = List<String>.from(json.decode(response.body));
    setState(() {
      types = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white, size: 24)),
        title: const Text("Jokes App",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
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
              icon: const Icon(Icons.plus_one, color: Colors.white, size: 24))
        ],
      ),
      body: StringGrid(
        entites: types,
      ),
    );
  }
}
