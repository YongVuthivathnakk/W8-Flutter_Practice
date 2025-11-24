import 'package:flutter/material.dart';
import 'package:w8_practice/pages/EXERCISE-4/model/jokes_model.dart';

Color appColor = Colors.green[300] as Color;

class Exercise4 extends StatelessWidget {
  List<JokesModel> jokesData;
  Exercise4({super.key, required this.jokesData});

  List<Widget> _getJokes() {
    return jokesData.map((joke) => FavoriteCard(joke: joke)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Dad Jokes"),
      ),
      body: ListView(
        children: [
          Column(children: [..._getJokes()]),
        ],
      ),
    );
  }
}

class FavoriteCard extends StatefulWidget {
  JokesModel joke;
  FavoriteCard({super.key, required this.joke});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  void onFavoriteClick() {
    setState(() {
      widget.joke.isFavorite = !widget.joke.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(widget.joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              widget.joke.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.joke.isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
